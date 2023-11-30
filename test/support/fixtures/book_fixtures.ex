defmodule PhoenixApp.BookFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PhoenixApp.Book` context.
  """

  @doc """
  Generate a article.
  """
  def article_fixture(attrs \\ %{}) do
    {:ok, article} =
      attrs
      |> Enum.into(%{
        content: "some content",
        title: "some title"
      })
      |> PhoenixApp.Book.create_article()

    article
  end
end
