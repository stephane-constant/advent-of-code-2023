defmodule Puzzle1Solver do
  @moduledoc """
  Documentation for `Puzzle1Solver`.
  """

  @doc """
  Solve puzzle1.

  ## Examples

      Puzzle1Solver.run("lib/puzzle_1_solver/puzzle_1_input_file.txt")

  """
  def run(puzzle_filename) do
    PuzzleInputReader.read_as_strings(puzzle_filename)
    |> Enum.map(&_parse/1)
    |> Enum.map(&_solve/1)
  end

  def _parse(puzzle_line) do
    IO.puts("Puzzle 1 : parse line #{puzzle_line}")
    puzzle_line
  end

  def _solve(calibration_value) do
    IO.puts("Puzzle 1 : add calibration value #{calibration_value}")
    calibration_value
  end
end
