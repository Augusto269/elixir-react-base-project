FROM elixir:1.15-alpine

RUN apk add --no-cache build-base npm git openssh-client

RUN mix local.hex --force && mix local.rebar --force

WORKDIR /app

COPY . .

RUN mix deps.get
RUN npm install --prefix assets
RUN mix compile

EXPOSE 4000

CMD ["mix", "phx.server"]
