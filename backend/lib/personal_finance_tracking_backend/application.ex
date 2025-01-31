defmodule PersonalFinanceTrackingBackend.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PersonalFinanceTrackingBackendWeb.Telemetry,
      PersonalFinanceTrackingBackend.Repo,
      {DNSCluster, query: Application.get_env(:personal_finance_tracking_backend, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: PersonalFinanceTrackingBackend.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: PersonalFinanceTrackingBackend.Finch},
      # Start a worker by calling: PersonalFinanceTrackingBackend.Worker.start_link(arg)
      # {PersonalFinanceTrackingBackend.Worker, arg},
      # Start to serve requests, typically the last entry
      PersonalFinanceTrackingBackendWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PersonalFinanceTrackingBackend.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PersonalFinanceTrackingBackendWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
