# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :skyskool,
  ecto_repos: [Skyskool.Repo]

# Configures the endpoint
config :skyskool, SkyskoolWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "6odzsYp2i+QbMwS+HBL4OnePy03T9PnlC1OOexNOqqyKl+DdG/wSJhlfYuz3abqJ",
  render_errors: [view: SkyskoolWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Skyskool.PubSub,
  live_view: [signing_salt: "Wpx6TFr7"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
