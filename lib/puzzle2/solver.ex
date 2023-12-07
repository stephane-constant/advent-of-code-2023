defmodule AdventOfCode2023.Puzzle2.Solver do
  require Logger

  alias AdventOfCode2023.Common.InputReader

  @moduledoc """
  Documentation for `Puzzle2.Solver`.
  """

  @doc """
  Solve puzzle 2.

  ## Examples

      AdventOfCode2023.Puzzle2.Solver.run("resources/puzzle2_input.txt")
      is expected to return xxx

  """
  def run(puzzle_filename) do
    InputReader.stream_as_strings(puzzle_filename)
    |> Enum.into([], fn line -> _parse(line) end)
    |> Enum.sum
    |> (fn solution ->
      Logger.info("Puzzle 2 : solution = #{solution}")
      solution
    end).()
  end

  defp _parse(puzzle_line) do
    digits_only = String.replace(puzzle_line, ~r/[^\d]/, "")
    first_digit = String.first(digits_only)
    last_digit = String.last(digits_only)
    Logger.debug("Puzzle 2 : parse line #{puzzle_line} => #{first_digit}#{last_digit}")
    String.to_integer(first_digit <> last_digit)
  end
end
