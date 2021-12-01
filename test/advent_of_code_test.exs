defmodule AdventOfCodeTest do
  use ExUnit.Case

  test "reads a file into a list of lines" do
    assert AdventOfCode.load_data("test.txt") == ["one", "two"]
  end
end
