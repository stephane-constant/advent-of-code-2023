defmodule Puzzle1Solver do
  require Logger

  @moduledoc """
  Documentation for `Puzzle1Solver`.
  """

  @doc """
  Solve puzzle1 by removing all non-digits characters from every line,
  then keep only first and last digit, convert as a new integer and sum them all.

  ## Examples

      Puzzle1Solver.run("resources/puzzle_1_input.txt")

  """
  def run(puzzle_filename) do
    PuzzleInputReader.read_as_strings(puzzle_filename)
    |> Enum.into([], fn line -> _parse(line) end)
    |> _solve()
  end

  defp _parse(puzzle_line) do
    Logger.debug("Puzzle 1 : parse line #{puzzle_line}")
    only_digits = String.replace(puzzle_line, ~r/[^\d]/, "")
    String.to_integer(String.first(only_digits) <> String.last(only_digits))
  end

  defp _solve(calibration_values) do
    Logger.debug("Puzzle 1 : calibration values #{inspect(calibration_values)}")
    Enum.reduce(calibration_values, 0, fn value, sum -> value + sum end)
  end
end
