defmodule PhoenixAppWeb.LettersController do
  use PhoenixAppWeb, :controller

  alias PhoenixApp.Message
  alias PhoenixApp.Message.Letters

  def index(conn, _params) do
    letters = Message.list_letters()
    render(conn, :index, letters_collection: letters)
  end

  def new(conn, _params) do
    changeset = Message.change_letters(%Letters{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"letters" => letters_params}) do
    case Message.create_letters(letters_params) do
      {:ok, letters} ->
        conn
        |> put_flash(:info, "Letters created successfully.")
        |> redirect(to: ~p"/letters/#{letters}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    letters = Message.get_letters!(id)
    render(conn, :show, letters: letters)
  end

  def edit(conn, %{"id" => id}) do
    letters = Message.get_letters!(id)
    changeset = Message.change_letters(letters)
    render(conn, :edit, letters: letters, changeset: changeset)
  end

  def update(conn, %{"id" => id, "letters" => letters_params}) do
    letters = Message.get_letters!(id)

    case Message.update_letters(letters, letters_params) do
      {:ok, letters} ->
        conn
        |> put_flash(:info, "Letters updated successfully.")
        |> redirect(to: ~p"/letters/#{letters}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, letters: letters, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    letters = Message.get_letters!(id)
    {:ok, _letters} = Message.delete_letters(letters)

    conn
    |> put_flash(:info, "Letters deleted successfully.")
    |> redirect(to: ~p"/letters")
  end
end
