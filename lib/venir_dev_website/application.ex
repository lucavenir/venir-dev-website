defmodule VenirDevWebsite.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      VenirDevWebsiteWeb.Telemetry,
      # VenirDevWebsite.Repo,
      {DNSCluster, query: Application.get_env(:venir_dev_website, :dns_cluster_query) || :ignore},
      # {Oban,
      #  AshOban.config(
      #    Application.fetch_env!(:venir_dev_website, :ash_domains),
      #    Application.fetch_env!(:venir_dev_website, Oban)
      #  )},
      {Phoenix.PubSub, name: VenirDevWebsite.PubSub},
      # Start a worker by calling: VenirDevWebsite.Worker.start_link(arg)
      # {VenirDevWebsite.Worker, arg},
      # Start to serve requests, typically the last entry
      VenirDevWebsiteWeb.Endpoint,
      {AshAuthentication.Supervisor, [otp_app: :venir_dev_website]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: VenirDevWebsite.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    VenirDevWebsiteWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
