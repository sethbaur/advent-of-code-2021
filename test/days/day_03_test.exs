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

  test "gets oxygen generator rating" do
    assert 23 = Day03.get_oxygen_rating(@data)
  end

  test "gets CO2 scrubber rating" do
    assert 10 = Day03.get_scrubber_rating(@data)
  end

  test "gets life support rating" do
    assert 230 = Day03.get_life_support_rating(@data)
  end
end
