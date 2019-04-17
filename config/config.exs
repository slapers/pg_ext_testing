# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :logger, level: :info

config :pg_ext, ecto_repos: [PgExt.Repo]

config :pg_ext, PgExt.Repo,
  database: "pg_ext_test",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  types: PgExt.PgTypes
