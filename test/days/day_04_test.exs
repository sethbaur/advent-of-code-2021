defmodule Day04Test do
  use ExUnit.Case
  alias AdventOfCode.Days.Day04

  @data [
    "7,4,9,5,11,17,23,2,0,14,21,24,10,16,13,6,15,25,12,22,18,20,8,19,3,26,1",
    "",
    "22 13 17 11  0",
    " 8  2 23  4 24",
    "21  9 14 16  7",
    " 6 10  3 18  5",
    " 1 12 20 15 19",
    "",
    " 3 15  0  2 22",
    " 9 18 13 17  5",
    "19  8  7 25 23",
    "20 11 10 24  4",
    "14 21 16 12  6",
    "",
    "14 21 17 24  4",
    "10 16 15  9 19",
    "18  8 23 26 20",
    "22 11 13  6  5",
    " 2  0 12  3  7"
  ]

  @row_winner [
    [{"14", :o}, {"21", :o}, {"17", :o}, {"24", :o}, {"4", :o}],
    [{"10", :x}, {"16", :x}, {"15", :x}, {"9", :x}, {"19", :x}],
    [{"18", :x}, {"8", :o}, {"23", :o}, {"26", :o}, {"20", :o}],
    [{"22", :x}, {"11", :x}, {"13", :x}, {"6", :x}, {"5", :x}],
    [{"2", :x}, {"0", :x}, {"12", :o}, {"3", :o}, {"7", :x}]
  ]

  @column_winner [
    [{"14", :x}, {"21", :x}, {"17", :x}, {"24", :o}, {"4", :x}],
    [{"10", :x}, {"16", :x}, {"15", :x}, {"9", :o}, {"19", :x}],
    [{"18", :o}, {"8", :x}, {"23", :x}, {"26", :o}, {"20", :o}],
    [{"22", :x}, {"11", :x}, {"13", :x}, {"6", :o}, {"5", :x}],
    [{"2", :x}, {"0", :x}, {"12", :o}, {"3", :o}, {"7", :x}]
  ]

  @loser [
    [{"14", :o}, {"21", :x}, {"17", :x}, {"24", :x}, {"4", :x}],
    [{"10", :x}, {"16", :x}, {"15", :o}, {"9", :o}, {"19", :x}],
    [{"18", :x}, {"8", :x}, {"23", :o}, {"26", :x}, {"20", :x}],
    [{"22", :x}, {"11", :o}, {"13", :x}, {"6", :x}, {"5", :x}],
    [{"2", :x}, {"0", :x}, {"12", :x}, {"3", :x}, {"7", :x}]
  ]

  test "calculates the winner's score" do
    assert 4512 == Day04.get_winning_score(@data)
  end

  test "calculates the squid's score" do
    assert 1924 == Day04.get_squids_score(@data)
  end

  test "checks for winner in rows" do
    assert @row_winner = Day04.winner_in_rows?(@row_winner)
    refute Day04.winner_in_rows?(@loser)
  end

  test "checks for winner in columns" do
    assert @column_winner = Day04.winner_in_columns(@column_winner)
    refute Day04.winner_in_columns(@loser)
  end
end
