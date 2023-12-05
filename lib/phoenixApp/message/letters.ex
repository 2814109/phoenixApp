defmodule PhoenixApp.Message.Letters do
  use Ecto.Schema
  import Ecto.Changeset

  schema "letters" do
    field :body, :string
    field :word_count, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(letters, attrs) do
    letters
    |> cast(attrs, [:body, :word_count])
    |> validate_required([:body, :word_count])
  end
end
