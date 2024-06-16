#lib/todo.ex
defmodule Todo do
  defstruct tasks: []

  @doc """
  Initializes a new to-do list.
  """
  def new() do
    %Todo{}
  end

  @doc """
  Adds a task to the to-do list.
  """
  def add_task(%Todo{tasks: tasks} = todo, task) do
    %Todo{todo | tasks: tasks ++ [task]}
  end

  @doc """
  Lists all tasks in the to-do list.
  """
  def list_tasks(%Todo{tasks: tasks}) do
    tasks
  end

  @doc """
  Deletes a task from the to-do list by its index.
  """
  def delete_task(%Todo{tasks: tasks} = todo, index) when is_integer(index) and index >= 0 do
    if index < length(tasks) do
      tasks = List.delete_at(tasks, index)
      %Todo{todo | tasks: tasks}
    else
      IO.puts("Task deletion failed. Invalid index: #{index}")
      todo
    end
  end
end