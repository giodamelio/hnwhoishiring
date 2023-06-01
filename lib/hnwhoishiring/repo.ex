defmodule HNWhoIsHiring.Repo do
  use Ecto.Repo,
    otp_app: :hnwhoishiring,
    adapter: Ecto.Adapters.SQLite3
end
