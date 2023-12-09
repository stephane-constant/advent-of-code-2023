defmodule AdventOfCode2023.Puzzle2Part2.Processor do

  alias AdventOfCode2023.Puzzle2.{Game, CubesSet}

  @doc """
  Multiplies and returns the number of cubes of each color.
  Trick : do not multiply by a color equal to 0.
  """
  def compute_cubes_power(%CubesSet{red: red_value, blue: blue_value, green: green_value}) do
    _color_multiplier(red_value) * _color_multiplier(blue_value) * _color_multiplier(green_value)
  end

  defp _color_multiplier(nil), do: 1
  defp _color_multiplier(0), do: 1
  defp _color_multiplier(value), do: value

  @doc """
  Returns the fewest number of cubes of each color (understand : ie the max number per color)
  that could have been in the bag to make it possible.
  """
  def find_fewest_cubes_per_game(%Game{cubes_sets: cubes_sets}) do
    %CubesSet{
      red: _fewest_nb_of_cubes_of_color(:red, cubes_sets),
      blue: _fewest_nb_of_cubes_of_color(:blue, cubes_sets),
      green: _fewest_nb_of_cubes_of_color(:green, cubes_sets)
    }
  end

  defp _fewest_nb_of_cubes_of_color(color, cubes_sets) do
    cubes_sets |> Enum.map(&Map.fetch!(&1, color)) |> Enum.max
  end

end
