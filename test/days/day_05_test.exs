defmodule Day05Test do
  use ExUnit.Case
  alias AdventOfCode.Days.Day05

  @data [
    "0,9 -> 5,9",
    "8,0 -> 0,8",
    "9,4 -> 3,4",
    "2,2 -> 2,1",
    "7,0 -> 7,4",
    "6,4 -> 2,0",
    "0,9 -> 2,9",
    "3,4 -> 1,4",
    "0,0 -> 8,8",
    "5,5 -> 8,2"
  ]

  test "counts overlaps" do
    5 = Day05.count_overlap_points(@data)
  end

  test "counts overlaps with diagonals" do
    12 = Day05.count_overlap_points_with_diagonals(@data)
  end

  test "formats data" do
    [
      {{0, 9}, {5, 9}},
      {{8, 0}, {0, 8}},
      {{9, 4}, {3, 4}},
      {{2, 2}, {2, 1}},
      {{7, 0}, {7, 4}},
      {{6, 4}, {2, 0}},
      {{0, 9}, {2, 9}},
      {{3, 4}, {1, 4}},
      {{0, 0}, {8, 8}},
      {{5, 5}, {8, 2}}
    ] = Day05.format_data(@data)
  end

  test "gets line points" do
    [{1, 1}, {1, 2}, {1, 3}] = Day05.get_points({{1, 1}, {1, 3}})
    [{9, 7}, {8, 7}, {7, 7}] = Day05.get_points({{9, 7}, {7, 7}})
    [{1, 1}, {2, 2}, {3, 3}] = Day05.get_points({{1, 1}, {3, 3}})
    [{9, 7}, {8, 8}, {7, 9}] = Day05.get_points({{9, 7}, {7, 9}})
  end
end
