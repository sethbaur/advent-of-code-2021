defmodule Day1Test do
  use ExUnit.Case
  doctest AdventOfCode

  test "calculates number of increases" do
    data = [
      # initial
      "1",
      # increase
      "2",
      # no increase
      "1",
      # increase
      "5",
      # increase
      "6"
    ]

    assert {_, 3} = AdventOfCode.Days.Day1.count_increases(data)
  end

  test "calculates number of increases in sliding window" do
    data = [
      "199",
      "200",
      "208",
      "210",
      "200",
      "207",
      "240",
      "269",
      "260",
      "263"
    ]

    assert {_, 5} = AdventOfCode.Days.Day1.count_increases_in_sliding_window(data)
  end
end
