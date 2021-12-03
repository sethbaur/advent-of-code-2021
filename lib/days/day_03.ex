defmodule AdventOfCode.Days.Day03 do
  def run(:a) do
    AdventOfCode.load_data("input03.txt")
    |> get_power_consumption()
  end

  def run(:b) do
    AdventOfCode.load_data("input03.txt")
  end

  def get_power_consumption(data) do
    get_rate(data, :gamma) * get_rate(data, :epsilon)
  end

  def get_rate(data, type) do
    number_length = data |> List.first() |> String.length()

    Range.new(0, number_length - 1)
    |> Enum.map(fn index ->
      data
      |> Enum.reduce([], fn number, acc -> [String.at(number, index) | acc] end)
    end)
    |> Enum.map(fn freq ->
      ones =
        freq
        |> Enum.filter(fn x -> x == "1" end)
        |> length()

      zeros =
        freq
        |> Enum.filter(fn x -> x == "0" end)
        |> length()

      compare(ones, zeros, type)
    end)
    |> List.to_string()
    |> AdventOfCode.string_to_int(2)
  end

  def compare(ones, zeros, :epsilon) do
    cond do
      ones < zeros -> "1"
      true -> "0"
    end
  end

  def compare(ones, zeros, :gamma) do
    cond do
      ones > zeros -> "1"
      true -> "0"
    end
  end
end
