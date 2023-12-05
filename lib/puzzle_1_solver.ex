defmodule Puzzle1Solver do
  @moduledoc """
  Documentation for `Puzzle1Solver`.
  """

  @doc """
  Solve puzzle1.

  ## Examples

      Puzzle1Solver.run("resources/puzzle_1_input.txt")

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

  def _get_first_digit(puzzle_line) do

  end

  def _get_last_digit(puzzle_line) do

  end

  def _get_two_digit_number(first_digit, last_digit) do

  end

  def _solve(calibration_value) do
    IO.puts("Puzzle 1 : add calibration value #{calibration_value}")
    calibration_value
  end
end
