defmodule Bookly.Repo do
  use Ecto.Repo,
    otp_app: :bookly,
    adapter: Ecto.Adapters.Postgres
end
