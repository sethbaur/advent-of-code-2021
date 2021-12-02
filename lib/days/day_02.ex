defmodule AdventOfCode.Days.Day02 do
  def run(:a) do
    AdventOfCode.load_data("input02.txt")
    |> get_position()
  end

  def run(:b) do
    AdventOfCode.load_data("input02.txt")
    |> get_position_with_aim()
  end

  def get_position(data) do
    {depth, horizontal} =
      data
      |> process_data()
      |> Enum.reduce({0, 0}, fn
        {:up, magnitude}, {depth, horizontal} ->
          {depth - magnitude, horizontal}

        {:down, magnitude}, {depth, horizontal} ->
          {depth + magnitude, horizontal}

        {:forward, magnitude}, {depth, horizontal} ->
          {depth, horizontal + magnitude}
      end)

    depth * horizontal
  end

  def get_position_with_aim(data) do
    {depth, horizontal, _} =
      data
      |> process_data()
      |> Enum.reduce({0, 0, 0}, fn
        {:up, magnitude}, {depth, horizontal, aim} ->
          {depth, horizontal, aim - magnitude}

        {:down, magnitude}, {depth, horizontal, aim} ->
          {depth, horizontal, aim + magnitude}

        {:forward, magnitude}, {depth, horizontal, aim} ->
          {depth + aim * magnitude, horizontal + magnitude, aim}
      end)

    depth * horizontal
  end

  def process_data(data) do
    data
    |> Enum.map(fn line ->
      line
      |> String.split()
      |> case do
        [direction, magnitude] ->
          {String.to_atom(direction), AdventOfCode.string_to_int(magnitude)}

        _ ->
          nil
      end
    end)
  end
end
