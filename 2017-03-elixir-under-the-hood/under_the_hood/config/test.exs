use Mix.Config

config :under_the_hood,
  :world, System.get_env("GREETING") || "${GREETING}"
