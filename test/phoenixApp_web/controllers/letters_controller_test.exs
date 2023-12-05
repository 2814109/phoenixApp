defmodule PhoenixAppWeb.LettersControllerTest do
  use PhoenixAppWeb.ConnCase

  import PhoenixApp.MessageFixtures

  @create_attrs %{body: "some body", word_count: 42}
  @update_attrs %{body: "some updated body", word_count: 43}
  @invalid_attrs %{body: nil, word_count: nil}

  describe "index" do
    test "lists all letters", %{conn: conn} do
      conn = get(conn, ~p"/letters")
      assert html_response(conn, 200) =~ "Listing Letters"
    end
  end

  describe "new letters" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/letters/new")
      assert html_response(conn, 200) =~ "New Letters"
    end
  end

  describe "create letters" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/letters", letters: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/letters/#{id}"

      conn = get(conn, ~p"/letters/#{id}")
      assert html_response(conn, 200) =~ "Letters #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/letters", letters: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Letters"
    end
  end

  describe "edit letters" do
    setup [:create_letters]

    test "renders form for editing chosen letters", %{conn: conn, letters: letters} do
      conn = get(conn, ~p"/letters/#{letters}/edit")
      assert html_response(conn, 200) =~ "Edit Letters"
    end
  end

  describe "update letters" do
    setup [:create_letters]

    test "redirects when data is valid", %{conn: conn, letters: letters} do
      conn = put(conn, ~p"/letters/#{letters}", letters: @update_attrs)
      assert redirected_to(conn) == ~p"/letters/#{letters}"

      conn = get(conn, ~p"/letters/#{letters}")
      assert html_response(conn, 200) =~ "some updated body"
    end

    test "renders errors when data is invalid", %{conn: conn, letters: letters} do
      conn = put(conn, ~p"/letters/#{letters}", letters: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Letters"
    end
  end

  describe "delete letters" do
    setup [:create_letters]

    test "deletes chosen letters", %{conn: conn, letters: letters} do
      conn = delete(conn, ~p"/letters/#{letters}")
      assert redirected_to(conn) == ~p"/letters"

      assert_error_sent 404, fn ->
        get(conn, ~p"/letters/#{letters}")
      end
    end
  end

  defp create_letters(_) do
    letters = letters_fixture()
    %{letters: letters}
  end
end
