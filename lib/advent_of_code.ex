defmodule AdventOfCode do
  def load_data(file_name) do
    Application.app_dir(:advent_of_code, ["priv", "data", file_name])
    |> File.stream!()
    |> Stream.map(&String.trim/1)
    |> Enum.to_list()
  end
end
