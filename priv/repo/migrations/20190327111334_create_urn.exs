defmodule PgExt.Repo.Migrations.CreateURN do
  @moduledoc """
  Represents a URN. See https://tools.ietf.org/html/rfc8141
  """

  use Ecto.Migration

  def up do
    execute """
      CREATE TYPE public.urn AS (nid varchar, nss varchar);
    """
  end

  def down do
    execute """
      DROP TYPE IF EXISTS public.urn
    """
  end
end
