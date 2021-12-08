defmodule AdventOfCode.Days.Day05 do
  import AdventOfCode

  def run(:a) do
    load_data("input05.txt")
    |> count_overlap_points()
  end

  def run(:b) do
    load_data("input05.txt")
    |> count_overlap_points_with_diagonals()
  end

  def count_overlap_points(data) do
    data
    |> format_data()
    |> Enum.filter(&is_straight_line?/1)
    |> count_overlaps()
  end

  def count_overlap_points_with_diagonals(data) do
    data
    |> format_data()
    |> count_overlaps()
  end

  def count_overlaps(data) do
    data
    |> Enum.map(&get_points/1)
    |> List.flatten()
    |> Enum.frequencies()
    |> Enum.filter(fn {_, count} -> count > 1 end)
    |> length()
  end

  def format_data(data) do
    data
    |> Enum.map(fn line ->
      line
      |> String.split(" -> ")
      |> Enum.map(fn coord ->
        coord
        |> String.split(",")
        |> Enum.map(&string_to_int/1)
        |> List.to_tuple()
      end)
      |> List.to_tuple()
    end)
  end

  def get_points({{x1, y1}, {x2, y2}}) do
    cond do
      x1 == x2 ->
        Range.new(y1, y2)
        |> Enum.to_list()
        |> Enum.map(&{x1, &1})

      y1 == y2 ->
        Range.new(x1, x2)
        |> Enum.to_list()
        |> Enum.map(&{&1, y1})

      true ->
        Range.new(x1, x2)
        |> Enum.to_list()
        |> Enum.zip(
          Range.new(y1, y2)
          |> Enum.to_list()
        )
    end
  end

  defp is_straight_line?({{x1, y1}, {x2, y2}}) do
    x1 == x2 || y1 == y2
  end
end
