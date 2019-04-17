defmodule PgExt.Repo do
  @moduledoc false

  use Ecto.Repo,
    otp_app: :pg_ext,
    adapter: Ecto.Adapters.Postgres
end
