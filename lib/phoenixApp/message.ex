defmodule PhoenixApp.Message do
  @moduledoc """
  The Message context.
  """

  import Ecto.Query, warn: false
  alias PhoenixApp.Repo

  alias PhoenixApp.Message.Letters

  @doc """
  Returns the list of letters.

  ## Examples

      iex> list_letters()
      [%Letters{}, ...]

  """
  def list_letters do
    Repo.all(Letters)
  end

  @doc """
  Gets a single letters.

  Raises `Ecto.NoResultsError` if the Letters does not exist.

  ## Examples

      iex> get_letters!(123)
      %Letters{}

      iex> get_letters!(456)
      ** (Ecto.NoResultsError)

  """
  def get_letters!(id), do: Repo.get!(Letters, id)

  @doc """
  Creates a letters.

  ## Examples

      iex> create_letters(%{field: value})
      {:ok, %Letters{}}

      iex> create_letters(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_letters(attrs \\ %{}) do
    %Letters{}
    |> Letters.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a letters.

  ## Examples

      iex> update_letters(letters, %{field: new_value})
      {:ok, %Letters{}}

      iex> update_letters(letters, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_letters(%Letters{} = letters, attrs) do
    letters
    |> Letters.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a letters.

  ## Examples

      iex> delete_letters(letters)
      {:ok, %Letters{}}

      iex> delete_letters(letters)
      {:error, %Ecto.Changeset{}}

  """
  def delete_letters(%Letters{} = letters) do
    Repo.delete(letters)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking letters changes.

  ## Examples

      iex> change_letters(letters)
      %Ecto.Changeset{data: %Letters{}}

  """
  def change_letters(%Letters{} = letters, attrs \\ %{}) do
    Letters.changeset(letters, attrs)
  end
end
