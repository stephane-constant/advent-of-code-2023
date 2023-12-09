defmodule AdventOfCode2023.Puzzle2.Parser do
  require Logger

  @doc """
  Parses a line of puzzle 2 and returns a map containing
  the game ID and the list of cubes sets.
  """
  def parse(puzzle_line) do
    with {:ok, [game_label | sets_labels]} <- _split_line(puzzle_line),
         {:ok, game_id} <- _extract_game_id(game_label),
         {:ok, cubes_sets} <- _extract_cubes_sets(sets_labels) do

      %{"id" => game_id, "cubes_sets" => cubes_sets}
    end
  end

  defp _split_line(puzzle_line), do: {:ok, String.split(puzzle_line, [":", ";"])}

  defp _extract_game_id("Game " <> game_id), do: {:ok, game_id}

  # sets_labels can be ["3 blue, 4 red", "2 green"]
  # then returns {:ok, [%{"blue" => "3", "red" => "4"}, %{"green" => "2"}]}
  def _extract_cubes_sets(sets_labels) do
    cubes_sets = sets_labels |> Enum.map(&_extract_cubes_set/1)
    {:ok, cubes_sets}
  end

  # cubes_label can be "3 blue, 4 red",
  # then returns %{"blue" => "3", "red" => "4"}
  defp _extract_cubes_set(cubes_label) do
    String.split(cubes_label, ",")
    |> Enum.map(&String.split/1)
    |> Enum.map(&:lists.reverse/1)
    |> Map.new(&List.to_tuple/1)
  end

end
