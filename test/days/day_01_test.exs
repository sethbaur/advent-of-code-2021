defmodule Day01Test do
  use ExUnit.Case

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

    assert 3 = AdventOfCode.Days.Day01.count_increases(data)
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

    assert 5 = AdventOfCode.Days.Day01.count_increases_in_sliding_window(data)
  end
end
