defmodule Server.Application do
  use Application
  require Logger

  @impl true
  def(start(_type, _args)) do
    children = [
      {Plug.Cowboy, scheme: :http, plug: Server.Router, options: [port: 4000]}
    ]

    opts = [strategy: :one_for_one, name: Server.Supervisor]

    Logger.info("Starting application...")

    Supervisor.start_link(children, opts)
  end
end
