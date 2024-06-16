#lib/todo_cli/application.ex

defmodule TodoCli.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = []
    opts = [strategy: :one_for_one, name: TodoCli.Supervisor]
    Supervisor.start_link(children, opts)

    # Start the CLI
    CLI.start()
  end
end