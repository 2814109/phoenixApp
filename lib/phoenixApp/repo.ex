defmodule PhoenixApp.Repo do
  use Ecto.Repo,
    otp_app: :phoenixApp,
    adapter: Ecto.Adapters.Postgres
end
