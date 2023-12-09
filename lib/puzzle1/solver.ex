defmodule AdventOfCode2023.Puzzle1.Solver do
  require Logger

  alias AdventOfCode2023.Common.InputReader

  @doc """
  Solves puzzle 1 by removing all non-digits characters from every line,
  then keep only first and last digits, convert as a new integer and sum them all.

  ## Examples

      AdventOfCode2023.Puzzle1.Solver.run("resources/puzzle1_input.txt")

  """
  def run(puzzle_filename) do
    InputReader.stream_as_strings(puzzle_filename)
    |> Enum.into([], fn line -> _parse(line) end)
    |> Enum.sum
    |> (fn solution ->
      Logger.info("Puzzle 1 : solution = #{solution}")
      solution
    end).()
  end

  defp _parse(puzzle_line) do
    digits_only = String.replace(puzzle_line, ~r/[^\d]/, "")
    first_digit = String.first(digits_only)
    last_digit = String.last(digits_only)
    Logger.debug("Puzzle 1 : parse line #{puzzle_line} => #{first_digit}#{last_digit}")
    String.to_integer(first_digit <> last_digit)
  end
end
