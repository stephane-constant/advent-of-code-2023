defmodule AdventOfCode2023.Puzzle2.Processor do

  @moduledoc false

  @max_red_cubes 12
  @max_green_cubes 13
  @max_blue_cubes 14

  @doc """
  Returns the sum of game ids which are "possible", ie check each cubes set :
  number of cubes in every color must be <= corresponding max value.
  """
  def sum_possible_game_ids(games) do
    [0 | games]
    |> Enum.reduce(fn game, sum ->
      %{"id" => game_id} = game

      case _is_game_possible?(game) do
        true -> sum + String.to_integer(game_id)
        _ -> sum
      end
    end)
  end

  defp _is_game_possible?(%{"cubes_sets" => cubes_sets}) do
    cubes_sets
    |> Enum.map(fn cubes_set ->
      _is_red_cube_ok?(cubes_set) and _is_green_cube_ok?(cubes_set) and _is_blue_cube_ok?(cubes_set)
    end)
    |> Enum.all?()
  end

  defp _is_red_cube_ok?(%{"red" => red_count}), do: String.to_integer(red_count) <= @max_red_cubes
  defp _is_red_cube_ok?(_), do: true

  defp _is_green_cube_ok?(%{"green" => green_count}), do: String.to_integer(green_count) <= @max_green_cubes
  defp _is_green_cube_ok?(_), do: true

  defp _is_blue_cube_ok?(%{"blue" => blue_count}), do: String.to_integer(blue_count) <= @max_blue_cubes
  defp _is_blue_cube_ok?(_), do: true

end
