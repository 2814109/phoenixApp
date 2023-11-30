defmodule PhoenixApp.BlogFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PhoenixApp.Blog` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        body: "some body",
        word_count: 42
      })
      |> PhoenixApp.Blog.create_post()

    post
  end
end
