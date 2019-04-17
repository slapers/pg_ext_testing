defmodule Book do
  use Ecto.Schema
  alias PgExt.URN

  @primary_key {:id, URN, autogenerate: false}
  schema "books" do
    field :title
  end
end
