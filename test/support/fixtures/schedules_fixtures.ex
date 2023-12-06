defmodule PhoenixApp.SchedulesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PhoenixApp.Schedules` context.
  """

  @doc """
  Generate a event.
  """
  def event_fixture(attrs \\ %{}) do
    {:ok, event} =
      attrs
      |> Enum.into(%{
        description: "some description",
        endAt: ~D[2023-12-05],
        startAt: ~D[2023-12-05]
      })
      |> PhoenixApp.Schedules.create_event()

    event
  end
end
