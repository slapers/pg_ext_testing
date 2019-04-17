defmodule PgExtTest do
  use ExUnit.Case
  import Ecto.Query
  alias PgExt.{URN, Repo}

  @id %URN{nid: "isbn", nss: :erlang.unique_integer([:positive]) |> to_string()}

  test "querying" do
    from(b in Book, where: b.id == ^@id)
    |> Repo.all()
  end
end
