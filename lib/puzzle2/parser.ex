defmodule AdventOfCode2023.Puzzle2.Parser do
  require Logger

  alias AdventOfCode2023.Puzzle2.{Game, CubesSet}

  @doc """
  Parses a line of puzzle 2 and returns a Game containing
  the game ID and a list of CubesSet.
  """
  def parse(puzzle_line) do
    with {:ok, [game_label | sets_labels]} <- _split_line(puzzle_line),
         {:ok, game_id} <- _extract_game_id(game_label),
         {:ok, cubes_sets} <- _extract_cubes_sets(sets_labels) do

      %Game{id: game_id, cubes_sets: cubes_sets}
    end
  end

  defp _split_line(puzzle_line), do: {:ok, String.split(puzzle_line, [":", ";"])}

  defp _extract_game_id("Game " <> game_id), do: {:ok, String.to_integer(game_id)}

  @doc """
  Returns {:ok, [%CubesSet{blue: 3, red: 4, green: 0}, %CubesSet{green: 2, red: 0, blue: 0}]}
  if sets_labels is ["3 blue, 4 red", "2 green"]
  """
  def _extract_cubes_sets(sets_labels) do
    cubes_sets = sets_labels |> Enum.map(&_extract_cubes_set/1)
    {:ok, cubes_sets}
  end

  @doc """
  Returns %CubesSet{blue: 3, red: 4, green: 0}
  if cubes_label is "3 blue, 4 red".
  """
  defp _extract_cubes_set(cubes_label) do
    String.split(cubes_label, ",")
    |> Enum.map(&String.split/1)
    |> Enum.map(&:lists.reverse/1)
    |> Map.new(&List.to_tuple/1)
    |> Enum.reduce(%CubesSet{}, fn {key, value}, acc ->
      Map.put(acc, String.to_atom(key), String.to_integer(value))
    end)
  end

end
