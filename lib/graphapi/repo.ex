defmodule Graphapi.Repo do
  use Ecto.Repo,
    otp_app: :graphapi,
    adapter: Ecto.Adapters.Postgres
end
