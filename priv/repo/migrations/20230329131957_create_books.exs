defmodule Bookly.Repo.Migrations.CreateBooks do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :author, :string
      add :authorlf, :string
      add :average_rating, :float
      add :remote_id, :integer
      add :bookshelves, {:array, :string}
      add :exclusive_shelf, :string
      add :date_added, :date
      add :date_read, :date
      add :pages_count, :integer
      add :publisher, :string
      add :title, :string

      timestamps()
    end
  end
end
