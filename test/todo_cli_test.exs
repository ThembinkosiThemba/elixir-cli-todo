defmodule TodoCliTest do
  use ExUnit.Case
  doctest TodoCli

  test "greets the world" do
    assert TodoCli.hello() == :world
  end
end
