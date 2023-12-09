defmodule AdventOfCode2023.Puzzle2.Processor do

  alias AdventOfCode2023.Puzzle2.{Game, CubesSet}

  @max_red_cubes 12
  @max_green_cubes 13
  @max_blue_cubes 14

  @doc """
  Returns the sum of game ids.
  """
  def sum_game_ids(games) do
    Enum.reduce(games, 0, fn %Game{id: game_id}, sum -> sum + game_id end)
  end

  @doc """
  Returns the games considered as "possible", ie check every of its cubes sets :
  number of cubes in every color must be <= corresponding max value.
  """
  def find_possible_games(games), do: Enum.filter(games, fn game -> _is_game_possible?(game) end)


  defp _is_game_possible?(%Game{cubes_sets: cubes_sets}) do
    cubes_sets
    |> Enum.map(fn cubes_set ->
      _is_red_cube_ok?(cubes_set) and _is_green_cube_ok?(cubes_set) and _is_blue_cube_ok?(cubes_set)
    end)
    |> Enum.all?()
  end

  defp _is_red_cube_ok?(%CubesSet{red: red_count}), do: red_count <= @max_red_cubes
  defp _is_red_cube_ok?(_), do: true

  defp _is_green_cube_ok?(%CubesSet{green: green_count}), do: green_count <= @max_green_cubes
  defp _is_green_cube_ok?(_), do: true

  defp _is_blue_cube_ok?(%CubesSet{blue: blue_count}), do: blue_count <= @max_blue_cubes
  defp _is_blue_cube_ok?(_), do: true

end
