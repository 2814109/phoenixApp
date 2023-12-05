defmodule PhoenixAppWeb.LettersHTML do
  use PhoenixAppWeb, :html

  embed_templates "letters_html/*"

  @doc """
  Renders a letters form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def letters_form(assigns)
end
