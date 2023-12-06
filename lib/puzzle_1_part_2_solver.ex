defmodule AdventOfCode2023.Puzzle1Part2Solver do
  require Logger

  import AdventOfCode2023.PuzzleInputReader

  @moduledoc """
  Documentation for `Puzzle1Part2Solver`.
  """

  @doc """
  Solve puzzle 1 part 2 by TBC.

  ## Examples

      AdventOfCode2023.Puzzle1Part2Solver.run("resources/puzzle_1_input.txt")

  """
  def run(puzzle_filename) do
    stream_as_strings(puzzle_filename)
    |> Enum.into([], fn line -> _parse(line) end)
    |> _solve()
    |> (fn solution ->
      Logger.info("Puzzle 1 part 2 : solution = #{solution}")
      solution
    end).()
  end

  defp _parse(puzzle_line) do
    Logger.debug("TODO : Puzzle 1 part 2 : parse line #{puzzle_line}")
    only_digits = String.replace(puzzle_line, ~r/[^\d]/, "")
    String.to_integer(String.first(only_digits) <> String.last(only_digits))
  end

  defp _solve(calibration_values) do
    Logger.debug("TODO Puzzle 1 part 2 : calibration values #{inspect(calibration_values)}")
    Enum.reduce(calibration_values, 0, fn value, sum -> value + sum end)
  end
end
