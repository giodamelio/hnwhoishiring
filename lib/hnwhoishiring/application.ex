defmodule HNWhoIsHiring.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      HNWhoIsHiringWeb.Telemetry,
      # Start the Ecto repository
      HNWhoIsHiring.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: HNWhoIsHiring.PubSub},
      # Start Finch
      {Finch, name: HNWhoIsHiring.Finch},
      # Start the Endpoint (http/https)
      HNWhoIsHiringWeb.Endpoint
      # Start a worker by calling: HNWhoIsHiring.Worker.start_link(arg)
      # {HNWhoIsHiring.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: HNWhoIsHiring.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    HNWhoIsHiringWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
