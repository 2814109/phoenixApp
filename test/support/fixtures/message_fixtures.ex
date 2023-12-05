defmodule PhoenixApp.MessageFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PhoenixApp.Message` context.
  """

  @doc """
  Generate a letters.
  """
  def letters_fixture(attrs \\ %{}) do
    {:ok, letters} =
      attrs
      |> Enum.into(%{
        body: "some body",
        word_count: 42
      })
      |> PhoenixApp.Message.create_letters()

    letters
  end
end
