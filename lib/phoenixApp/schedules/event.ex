defmodule PhoenixApp.Schedules.Event do
  use Ecto.Schema
  import Ecto.Changeset

  schema "events" do
    field :description, :string
    field :startAt, :date
    field :endAt, :date

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [:startAt, :endAt, :description])
    |> validate_required([:startAt, :endAt, :description])
  end
end
