defmodule PhoenixApp.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :body, :string
      add :word_count, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
