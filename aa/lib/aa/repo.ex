defmodule Aa.Repo do
  use Ecto.Repo,
    otp_app: :aa,
    adapter: Ecto.Adapters.Postgres
end
