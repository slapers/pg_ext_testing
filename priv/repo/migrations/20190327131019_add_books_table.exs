defmodule PgExt.Repo.Migrations.AddBooksTable do
  use Ecto.Migration

  def change do
    create table(:books, primary_key: false) do
      add :id, :urn, primary_key: true
      add :title, :string
    end
  end
end
