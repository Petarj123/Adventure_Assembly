defmodule Aa.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      AaWeb.Telemetry,
      Aa.Repo,
      {DNSCluster, query: Application.get_env(:aa, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Aa.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Aa.Finch},
      # Start a worker by calling: Aa.Worker.start_link(arg)
      # {Aa.Worker, arg},
      # Start to serve requests, typically the last entry
      AaWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Aa.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    AaWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
