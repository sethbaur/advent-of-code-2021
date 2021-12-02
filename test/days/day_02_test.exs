defmodule Day02Test do
  use ExUnit.Case
  alias AdventOfCode.Days.Day02

  @data [
    "forward 5",
    "down 5",
    "forward 8",
    "up 3",
    "down 8",
    "forward 2"
  ]

  test "returns multiplied horizontal position and depth" do
    assert 150 = Day02.get_position(@data)
  end

  test "returns multiplied horizontal position and depth using aim" do
    assert 900 = Day02.get_position_with_aim(@data)
  end

  test "processes data into useful shape" do
    assert [
             {:forward, 5},
             {:down, 5},
             {:forward, 8},
             {:up, 3},
             {:down, 8},
             {:forward, 2}
           ] = Day02.process_data(@data)
  end
end
