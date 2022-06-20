defmodule Graphapi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Graphapi.Repo,
      # Start the Telemetry supervisor
      GraphapiWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Graphapi.PubSub},
      # Start the Endpoint (http/https)
      GraphapiWeb.Endpoint
      # Start a worker by calling: Graphapi.Worker.start_link(arg)
      # {Graphapi.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Graphapi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    GraphapiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
