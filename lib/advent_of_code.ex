defmodule AdventOfCode do
  def load_data(file_name) do
    Application.app_dir(:advent_of_code, ["priv", "data", file_name])
    |> File.stream!()
    |> Stream.map(&String.trim/1)
    |> Enum.to_list()
  end

  def string_to_int(string) do
    string
    |> Integer.parse()
    |> case do
      {int, _} ->
        int

      _ ->
        nil
    end
  end
end
