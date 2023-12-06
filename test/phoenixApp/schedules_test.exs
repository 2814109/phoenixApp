defmodule PhoenixApp.SchedulesTest do
  use PhoenixApp.DataCase

  alias PhoenixApp.Schedules

  describe "events" do
    alias PhoenixApp.Schedules.Event

    import PhoenixApp.SchedulesFixtures

    @invalid_attrs %{description: nil, startAt: nil, endAt: nil}

    test "list_events/0 returns all events" do
      event = event_fixture()
      assert Schedules.list_events() == [event]
    end

    test "get_event!/1 returns the event with given id" do
      event = event_fixture()
      assert Schedules.get_event!(event.id) == event
    end

    test "create_event/1 with valid data creates a event" do
      valid_attrs = %{description: "some description", startAt: ~D[2023-12-05], endAt: ~D[2023-12-05]}

      assert {:ok, %Event{} = event} = Schedules.create_event(valid_attrs)
      assert event.description == "some description"
      assert event.startAt == ~D[2023-12-05]
      assert event.endAt == ~D[2023-12-05]
    end

    test "create_event/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Schedules.create_event(@invalid_attrs)
    end

    test "update_event/2 with valid data updates the event" do
      event = event_fixture()
      update_attrs = %{description: "some updated description", startAt: ~D[2023-12-06], endAt: ~D[2023-12-06]}

      assert {:ok, %Event{} = event} = Schedules.update_event(event, update_attrs)
      assert event.description == "some updated description"
      assert event.startAt == ~D[2023-12-06]
      assert event.endAt == ~D[2023-12-06]
    end

    test "update_event/2 with invalid data returns error changeset" do
      event = event_fixture()
      assert {:error, %Ecto.Changeset{}} = Schedules.update_event(event, @invalid_attrs)
      assert event == Schedules.get_event!(event.id)
    end

    test "delete_event/1 deletes the event" do
      event = event_fixture()
      assert {:ok, %Event{}} = Schedules.delete_event(event)
      assert_raise Ecto.NoResultsError, fn -> Schedules.get_event!(event.id) end
    end

    test "change_event/1 returns a event changeset" do
      event = event_fixture()
      assert %Ecto.Changeset{} = Schedules.change_event(event)
    end
  end
end
