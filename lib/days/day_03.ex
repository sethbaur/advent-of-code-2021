defmodule AdventOfCode.Days.Day03 do
  def run(:a) do
    AdventOfCode.load_data("input03.txt")
    |> get_power_consumption()
  end

  def run(:b) do
    AdventOfCode.load_data("input03.txt")
    |> get_life_support_rating()
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

  # part 2

  def get_life_support_rating(data) do
    get_oxygen_rating(data) * get_scrubber_rating(data)
  end

  def get_oxygen_rating(data) do
    rating =
      data
      |> Enum.map(fn x -> {x, x} end)
      |> filter_by_common_digit()

    :erlang.binary_to_integer(rating, 2)
  end

  def get_scrubber_rating(data) do
    rating =
      data
      |> Enum.map(fn x -> {x, x} end)
      |> filter_by_least_common_digit()

    :erlang.binary_to_integer(rating, 2)
  end

  def filter_by_common_digit([{<<_::binary-size(0)>>, orig}]), do: orig

  def filter_by_common_digit(data) do
    ones =
      get_ones(data)

    zeros =
      get_zeros(data)

    cond do
      length(ones) >= length(zeros) ->
        filter_by_common_digit(ones)

      true ->
        filter_by_common_digit(zeros)
    end
  end

  def filter_by_least_common_digit([{_, orig}]), do: orig

  def filter_by_least_common_digit(data) do
    ones =
      get_ones(data)

    zeros =
      get_zeros(data)

    cond do
      length(ones) >= length(zeros) ->
        filter_by_least_common_digit(zeros)

      true ->
        filter_by_least_common_digit(ones)
    end
  end

  def get_ones(data) do
    data
    |> Enum.map(fn {<<head::binary-size(1)>> <> rest, orig} -> {head, {rest, orig}} end)
    |> Enum.filter(fn {digit, _} -> digit == "1" end)
    |> Enum.map(fn {_, orig} -> orig end)
  end

  def get_zeros(data) do
    data
    |> Enum.map(fn {<<head::binary-size(1)>> <> rest, orig} -> {head, {rest, orig}} end)
    |> Enum.filter(fn {digit, _} -> digit == "0" end)
    |> Enum.map(fn {_, orig} -> orig end)
  end
end
