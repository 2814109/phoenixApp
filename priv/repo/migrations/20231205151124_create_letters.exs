defmodule PhoenixApp.Repo.Migrations.CreateLetters do
  use Ecto.Migration

  def change do
    create table(:letters) do
      add :body, :string
      add :word_count, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
