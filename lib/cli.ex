#lib/cli.ex
defmodule CLI do
  alias Todo

  @doc """
  Starts the CLI and processes user commands.
  """
  def start() do
    todo = Todo.new()
    loop(todo)
  end

  defp loop(todo) do
    IO.puts("Commands: add <task>, list, delete <index>, quit")
    command = IO.gets("> ") |> String.trim()

    new_todo =
      case String.split(command) do
        ["add" | task] ->
          task = Enum.join(task, " ")
          todo = Todo.add_task(todo, task)
          IO.puts("Task added.")
          todo

        ["list"] ->
          IO.puts("Tasks:")
          Enum.with_index(Todo.list_tasks(todo))
          |> Enum.each(fn {task, index} -> IO.puts("#{index + 1}. #{task}") end)
          todo

        ["delete", index_str] ->
          case Integer.parse(index_str) do
            {index, _} when index > 0 ->
              todo = Todo.delete_task(todo, index - 1)
              IO.puts("Task deleted.")
              todo

            :error ->
              IO.puts("Invalid index. Please enter a valid number.")
              todo
          end

        ["quit"] ->
          IO.puts("Goodbye!")
          :stop

        _ ->
          IO.puts("Invalid command.")
          todo
      end

    if new_todo != :stop do
      loop(new_todo)
    end
  end
end