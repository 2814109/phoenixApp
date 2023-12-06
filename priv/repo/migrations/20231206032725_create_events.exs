defmodule PhoenixApp.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :startAt, :date
      add :endAt, :date
      add :description, :string

      timestamps(type: :utc_datetime)
    end
  end
end
