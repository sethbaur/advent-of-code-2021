defmodule AdventOfCode.Days.Day04 do
  import AdventOfCode

  def run(:a) do
    load_data("input04.txt")
    |> get_winning_score()
  end

  def run(:b) do
    load_data("input04.txt")
    |> get_squids_score()
  end

  def get_winning_score([draws | _] = data) do
    boards =
      data
      |> setup_boards()

    play_round(draws |> String.split(","), boards)
  end

  def get_squids_score([draws | _] = data) do
    boards =
      data
      |> setup_boards()

    {winners, _} =
      draws
      |> String.split(",")
      |> Enum.reduce({[], boards}, fn number, {winners, all} ->
        updated_boards = execute_round(number, all)

        case check_for_winners(updated_boards) do
          [] ->
            {winners, updated_boards}

          winner ->
            ws = winner |> Enum.map(&{&1, number})
            bs = updated_boards |> Enum.reject(&Enum.member?(winner, &1))
            {ws ++ winners, bs}
        end
      end)

    {winner, number} =
      winners
      |> List.first()

    return_winner(winner, number)
  end

  def execute_round(drawn, boards) do
    boards
    |> Enum.map(fn board ->
      board
      |> Enum.map(fn row ->
        row
        |> Enum.map(fn
          {^drawn, _} ->
            {drawn, :o}

          number ->
            number
        end)
      end)
    end)
  end

  def play_round([], _boards), do: nil

  def play_round([drawn | rest], boards) do
    updated_boards = execute_round(drawn, boards)

    case check_for_winner(updated_boards) do
      nil ->
        play_round(rest, updated_boards)

      winner ->
        return_winner(winner, drawn)
    end
  end

  def return_winner(board, number) do
    sum =
      board
      |> Enum.reduce(0, fn row, acc ->
        row_sum =
          row
          |> Enum.filter(&match?({_, :x}, &1))
          |> Enum.reduce(0, fn {cell, _}, row_acc ->
            row_acc + string_to_int(cell)
          end)

        row_sum + acc
      end)

    sum * string_to_int(number)
  end

  def check_for_winner(boards) do
    win_in_rows? =
      boards
      |> Enum.map(&winner_in_rows?/1)
      |> Enum.filter(& &1)
      |> List.first()

    win_in_columns? =
      boards
      |> Enum.map(&winner_in_columns/1)
      |> Enum.filter(& &1)
      |> List.first()

    win_in_columns? || win_in_rows?
  end

  def check_for_winners(boards) do
    win_in_rows? =
      boards
      |> Enum.map(&winner_in_rows?/1)

    win_in_columns? =
      boards
      |> Enum.map(&winner_in_columns/1)

    (win_in_columns? ++ win_in_rows?)
    |> Enum.filter(& &1)
  end

  def winner_in_rows?(board) do
    board
    |> Enum.filter(fn row ->
      row
      |> Enum.all?(&match?({_, :o}, &1))
    end)
    |> case do
      [] ->
        false

      _winner ->
        board
    end
  end

  def winner_in_columns(board) do
    Range.new(0, 4)
    |> Enum.reduce_while(false, fn column, _ ->
      board
      |> Enum.map(fn row -> Enum.at(row, column) end)
      |> Enum.all?(&match?({_, :o}, &1))
      |> case do
        false ->
          {:cont, false}

        true ->
          {:halt, board}
      end
    end)
  end

  def setup_boards([_ | [_ | boards]]) do
    boards
    |> Enum.filter(&(&1 != ""))
    |> Enum.chunk_every(5)
    |> Enum.map(&setup_board/1)
  end

  def setup_board(board) do
    board
    |> Enum.map(fn row ->
      row
      |> String.trim()
      |> String.split()
      |> Enum.map(&{&1, :x})
    end)
  end
end
