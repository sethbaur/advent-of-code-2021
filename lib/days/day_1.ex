defmodule AdventOfCode.Days.Day1 do
  def run(:a) do
    AdventOfCode.load_data("input1.txt")
    |> count_increases()
  end

  def run(:b) do
    AdventOfCode.load_data("input1.txt")
    |> count_increases_in_sliding_window()
  end

  def count_increases(data) do
    data
    |> Enum.map(&Integer.parse/1)
    |> count()
  end

  def count_increases_in_sliding_window(data) do
    get = fn idx ->
      Enum.at(data, idx)
      |> Integer.parse()
      |> case do
        {int, _} ->
          int

        _ ->
          nil
      end
    end

    Range.new(0, length(data) - 3)
    |> Enum.map(fn index -> get.(index) + get.(index + 1) + get.(index + 2) end)
    |> count()
  end

  defp count(data) do
    data
    |> Enum.reduce({nil, 0}, fn
      measurement, {nil, 0} ->
        {measurement, 0}

      measurement, {previous, increases} ->
        cond do
          measurement > previous ->
            {measurement, increases + 1}

          true ->
            {measurement, increases}
        end
    end)
  end
end
