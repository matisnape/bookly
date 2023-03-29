defmodule Bookly.Book do
  use Ecto.Schema
  import Ecto.Changeset

  schema "books" do
    field :author, :string
    field :authorlf, :string
    field :average_rating, :float
    field :remote_id, :integer
    field :bookshelves, {:array, :string}
    field :exclusive_shelf, :string
    field :date_added, :date
    field :date_read, :date
    field :pages_count, :integer
    field :publisher, :string, default: "unknown"
    field :title, :string

    timestamps()
  end

  @required_fields ~w(author authorlf average_rating remote_id bookshelves exclusive_shelf date_added publisher title)a

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields)
    |> validate_required(@required_fields)
  end
end
