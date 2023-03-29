defmodule BooklyWeb.BookLiveTest do
  use BooklyWeb.ConnCase

  import Phoenix.LiveViewTest
  import Bookly.BooksFixtures

  @create_attrs %{author: "some author", authorlf: "some authorlf", average_rating: 120.5, bookshelves: ["option1", "option2"], date_added: "2023-03-28", date_read: "2023-03-28", exclusive_shelf: "some exclusive_shelf", pages_count: 42, publisher: "some publisher", remote_id: 42, title: "some title"}
  @update_attrs %{author: "some updated author", authorlf: "some updated authorlf", average_rating: 456.7, bookshelves: ["option1"], date_added: "2023-03-29", date_read: "2023-03-29", exclusive_shelf: "some updated exclusive_shelf", pages_count: 43, publisher: "some updated publisher", remote_id: 43, title: "some updated title"}
  @invalid_attrs %{author: nil, authorlf: nil, average_rating: nil, bookshelves: [], date_added: nil, date_read: nil, exclusive_shelf: nil, pages_count: nil, publisher: nil, remote_id: nil, title: nil}

  defp create_book(_) do
    book = book_fixture()
    %{book: book}
  end

  describe "Index" do
    setup [:create_book]

    test "lists all books", %{conn: conn, book: book} do
      {:ok, _index_live, html} = live(conn, ~p"/books")

      assert html =~ "Listing Books"
      assert html =~ book.author
    end

    test "saves new book", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/books")

      assert index_live |> element("a", "New Book") |> render_click() =~
               "New Book"

      assert_patch(index_live, ~p"/books/new")

      assert index_live
             |> form("#book-form", book: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#book-form", book: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/books")

      html = render(index_live)
      assert html =~ "Book created successfully"
      assert html =~ "some author"
    end

    test "updates book in listing", %{conn: conn, book: book} do
      {:ok, index_live, _html} = live(conn, ~p"/books")

      assert index_live |> element("#books-#{book.id} a", "Edit") |> render_click() =~
               "Edit Book"

      assert_patch(index_live, ~p"/books/#{book}/edit")

      assert index_live
             |> form("#book-form", book: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#book-form", book: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/books")

      html = render(index_live)
      assert html =~ "Book updated successfully"
      assert html =~ "some updated author"
    end

    test "deletes book in listing", %{conn: conn, book: book} do
      {:ok, index_live, _html} = live(conn, ~p"/books")

      assert index_live |> element("#books-#{book.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#books-#{book.id}")
    end
  end

  describe "Show" do
    setup [:create_book]

    test "displays book", %{conn: conn, book: book} do
      {:ok, _show_live, html} = live(conn, ~p"/books/#{book}")

      assert html =~ "Show Book"
      assert html =~ book.author
    end

    test "updates book within modal", %{conn: conn, book: book} do
      {:ok, show_live, _html} = live(conn, ~p"/books/#{book}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Book"

      assert_patch(show_live, ~p"/books/#{book}/show/edit")

      assert show_live
             |> form("#book-form", book: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#book-form", book: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/books/#{book}")

      html = render(show_live)
      assert html =~ "Book updated successfully"
      assert html =~ "some updated author"
    end
  end
end
