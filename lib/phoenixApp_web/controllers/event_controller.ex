defmodule PhoenixAppWeb.EventController do
  use PhoenixAppWeb, :controller

  alias PhoenixApp.Schedules
  alias PhoenixApp.Schedules.Event

  def index(conn, _params) do
    events = Schedules.list_events()
    render(conn, :index, events: events)
  end

  def new(conn, _params) do
    changeset = Schedules.change_event(%Event{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"event" => event_params}) do
    case Schedules.create_event(event_params) do
      {:ok, event} ->
        conn
        |> put_flash(:info, "Event created successfully.")
        |> redirect(to: ~p"/events/#{event}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    event = Schedules.get_event!(id)
    render(conn, :show, event: event)
  end

  def edit(conn, %{"id" => id}) do
    event = Schedules.get_event!(id)
    changeset = Schedules.change_event(event)
    render(conn, :edit, event: event, changeset: changeset)
  end

  def update(conn, %{"id" => id, "event" => event_params}) do
    event = Schedules.get_event!(id)

    case Schedules.update_event(event, event_params) do
      {:ok, event} ->
        conn
        |> put_flash(:info, "Event updated successfully.")
        |> redirect(to: ~p"/events/#{event}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, event: event, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    event = Schedules.get_event!(id)
    {:ok, _event} = Schedules.delete_event(event)

    conn
    |> put_flash(:info, "Event deleted successfully.")
    |> redirect(to: ~p"/events")
  end
end
