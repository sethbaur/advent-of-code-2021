defmodule AdventOfCodeTest do
  use ExUnit.Case
  doctest AdventOfCode

  test "reads a file into a list of lines" do
    assert AdventOfCode.load_data("test.txt") == ["one", "two"]
  end
end
