use Mix.Config

config :pleroma, Pleroma.Web.Endpoint,
   http: [ ip: {0, 0, 0, 0}, ],
   url: [host: "127.0.0.1", scheme: "http", port: 80],
   secret_key_base: "wololo"

config :pleroma, :instance,
  name: "log",
  email: "admin@email.tld",
  limit: 5000,
  registrations_open: false

config :pleroma, :media_proxy,
  enabled: false,
  redirect_on_failure: true,
  base_url: "https://cache.domain.tld"

# Configure your database
config :pleroma, Pleroma.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "pleroma",
  password: "pleroma",
  database: "pleroma",
  hostname: "db-pleroma",
  pool_size: 10
