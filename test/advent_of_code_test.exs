defmodule AdventOfCodeTest do
  use ExUnit.Case

  test "reads a file into a list of lines" do
    assert AdventOfCode.load_data("test.txt") == ["one", "two"]
  end

  test "converts string to integer" do
    assert AdventOfCode.string_to_int("123") == 123
  end
end
