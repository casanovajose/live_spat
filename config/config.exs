# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :live_spat,
  ecto_repos: [LiveSpat.Repo]

# Configures the endpoint
config :live_spat, LiveSpatWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "NZfAgeViuidxWkGyJQkkqbqYU1OT2xd0gz8Bl/LBNbTFPBXGe39AL60TbS4B1dru",
  render_errors: [view: LiveSpatWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: LiveSpat.PubSub,
  live_view: [signing_salt: "c6DycY+/"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
