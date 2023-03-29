defmodule Bookly.BooksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Bookly.Books` context.
  """

  @doc """
  Generate a book.
  """
  def book_fixture(attrs \\ %{}) do
    {:ok, book} =
      attrs
      |> Enum.into(%{
        author: "some author",
        rating: "some rating",
        title: "some title"
      })
      |> Bookly.Books.create_book()

    book
  end

  @doc """
  Generate a book.
  """
  def book_fixture(attrs \\ %{}) do
    {:ok, book} =
      attrs
      |> Enum.into(%{
        author: "some author",
        authorlf: "some authorlf",
        average_rating: 120.5,
        bookshelves: ["option1", "option2"],
        date_added: ~D[2023-03-28],
        date_read: ~D[2023-03-28],
        exclusive_shelf: "some exclusive_shelf",
        pages_count: 42,
        publisher: "some publisher",
        remote_id: 42,
        title: "some title"
      })
      |> Bookly.Books.create_book()

    book
  end
end
