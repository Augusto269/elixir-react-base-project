defmodule PersonalFinanceTrackingBackend.Repo do
  use Ecto.Repo,
    otp_app: :personal_finance_tracking_backend,
    adapter: Ecto.Adapters.Postgres
end
