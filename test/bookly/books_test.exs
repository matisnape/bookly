defmodule Bookly.BooksTest do
  use Bookly.DataCase

  alias Bookly.Books

  describe "books" do
    alias Bookly.Models.Book

    import Bookly.BooksFixtures

    @invalid_attrs %{author: nil, rating: nil, title: nil}

    test "list_books/0 returns all books" do
      book = book_fixture()
      assert Books.list_books() == [book]
    end

    test "get_book!/1 returns the book with given id" do
      book = book_fixture()
      assert Books.get_book!(book.id) == book
    end

    test "create_book/1 with valid data creates a book" do
      valid_attrs = %{author: "some author", rating: "some rating", title: "some title"}

      assert {:ok, %Book{} = book} = Books.create_book(valid_attrs)
      assert book.author == "some author"
      assert book.rating == "some rating"
      assert book.title == "some title"
    end

    test "create_book/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Books.create_book(@invalid_attrs)
    end

    test "update_book/2 with valid data updates the book" do
      book = book_fixture()

      update_attrs = %{
        author: "some updated author",
        rating: "some updated rating",
        title: "some updated title"
      }

      assert {:ok, %Book{} = book} = Books.update_book(book, update_attrs)
      assert book.author == "some updated author"
      assert book.rating == "some updated rating"
      assert book.title == "some updated title"
    end

    test "update_book/2 with invalid data returns error changeset" do
      book = book_fixture()
      assert {:error, %Ecto.Changeset{}} = Books.update_book(book, @invalid_attrs)
      assert book == Books.get_book!(book.id)
    end

    test "delete_book/1 deletes the book" do
      book = book_fixture()
      assert {:ok, %Book{}} = Books.delete_book(book)
      assert_raise Ecto.NoResultsError, fn -> Books.get_book!(book.id) end
    end

    test "change_book/1 returns a book changeset" do
      book = book_fixture()
      assert %Ecto.Changeset{} = Books.change_book(book)
    end
  end

  describe "books" do
    alias Bookly.Books.Book

    import Bookly.BooksFixtures

    @invalid_attrs %{author: nil, authorlf: nil, average_rating: nil, bookshelves: nil, date_added: nil, date_read: nil, exclusive_shelf: nil, pages_count: nil, publisher: nil, remote_id: nil, title: nil}

    test "list_books/0 returns all books" do
      book = book_fixture()
      assert Books.list_books() == [book]
    end

    test "get_book!/1 returns the book with given id" do
      book = book_fixture()
      assert Books.get_book!(book.id) == book
    end

    test "create_book/1 with valid data creates a book" do
      valid_attrs = %{author: "some author", authorlf: "some authorlf", average_rating: 120.5, bookshelves: ["option1", "option2"], date_added: ~D[2023-03-28], date_read: ~D[2023-03-28], exclusive_shelf: "some exclusive_shelf", pages_count: 42, publisher: "some publisher", remote_id: 42, title: "some title"}

      assert {:ok, %Book{} = book} = Books.create_book(valid_attrs)
      assert book.author == "some author"
      assert book.authorlf == "some authorlf"
      assert book.average_rating == 120.5
      assert book.bookshelves == ["option1", "option2"]
      assert book.date_added == ~D[2023-03-28]
      assert book.date_read == ~D[2023-03-28]
      assert book.exclusive_shelf == "some exclusive_shelf"
      assert book.pages_count == 42
      assert book.publisher == "some publisher"
      assert book.remote_id == 42
      assert book.title == "some title"
    end

    test "create_book/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Books.create_book(@invalid_attrs)
    end

    test "update_book/2 with valid data updates the book" do
      book = book_fixture()
      update_attrs = %{author: "some updated author", authorlf: "some updated authorlf", average_rating: 456.7, bookshelves: ["option1"], date_added: ~D[2023-03-29], date_read: ~D[2023-03-29], exclusive_shelf: "some updated exclusive_shelf", pages_count: 43, publisher: "some updated publisher", remote_id: 43, title: "some updated title"}

      assert {:ok, %Book{} = book} = Books.update_book(book, update_attrs)
      assert book.author == "some updated author"
      assert book.authorlf == "some updated authorlf"
      assert book.average_rating == 456.7
      assert book.bookshelves == ["option1"]
      assert book.date_added == ~D[2023-03-29]
      assert book.date_read == ~D[2023-03-29]
      assert book.exclusive_shelf == "some updated exclusive_shelf"
      assert book.pages_count == 43
      assert book.publisher == "some updated publisher"
      assert book.remote_id == 43
      assert book.title == "some updated title"
    end

    test "update_book/2 with invalid data returns error changeset" do
      book = book_fixture()
      assert {:error, %Ecto.Changeset{}} = Books.update_book(book, @invalid_attrs)
      assert book == Books.get_book!(book.id)
    end

    test "delete_book/1 deletes the book" do
      book = book_fixture()
      assert {:ok, %Book{}} = Books.delete_book(book)
      assert_raise Ecto.NoResultsError, fn -> Books.get_book!(book.id) end
    end

    test "change_book/1 returns a book changeset" do
      book = book_fixture()
      assert %Ecto.Changeset{} = Books.change_book(book)
    end
  end
end
