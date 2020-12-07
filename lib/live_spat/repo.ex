defmodule LiveSpat.Repo do
  use Ecto.Repo,
    otp_app: :live_spat,
    adapter: Ecto.Adapters.Postgres
end
