import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :hnwhoishiring, HNWhoIsHiring.Repo,
  database: Path.expand("../hnwhoishiring_test.db", Path.dirname(__ENV__.file)),
  pool_size: 5,
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :hnwhoishiring, HNWhoIsHiringWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "N+t1cDhg5uVuH4p6l/gKTK/GfaJCE78yc3EoFJdJSRKX5KrgpfbWPukCl0QftrAE",
  server: false

# In test we don't send emails.
config :hnwhoishiring, HNWhoIsHiring.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
