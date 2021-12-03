defmodule Day03Test do
  use ExUnit.Case
  alias AdventOfCode.Days.Day03

  @data [
    "00100",
    "11110",
    "10110",
    "10111",
    "10101",
    "01111",
    "00111",
    "11100",
    "10000",
    "11001",
    "00010",
    "01010"
  ]

  test "multiples gamma rate by epsilon rate" do
    assert 198 = Day03.get_power_consumption(@data)
  end
end
