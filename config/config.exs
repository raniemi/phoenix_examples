# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :phoenix_examples,
  ecto_repos: [PhoenixExamples.Repo]

# Configures the endpoint
config :phoenix_examples, PhoenixExamples.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "jPn49sjun1AoqY7j4HlwnBGQubCnLBr39anXIG75Pk5afDhSCYXHcJWcn7rYSmFF",
  render_errors: [view: PhoenixExamples.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhoenixExamples.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
