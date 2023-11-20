defmodule Skyskool.Repo do
  use Ecto.Repo,
    otp_app: :skyskool,
    adapter: Ecto.Adapters.Postgres
end
