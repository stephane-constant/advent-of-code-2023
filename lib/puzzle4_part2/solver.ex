defmodule AdventOfCode2023.Puzzle4Part2.Solver do
  require Logger

  alias AdventOfCode2023.Common.InputReader
  alias AdventOfCode2023.Puzzle4.{Parser, Processor}
  alias AdventOfCode2023.Puzzle4Part2.CardCounter

  @doc """
  Solves puzzle 4 Part 2 by finding the winning numbers,
  then copying the following cards (as much as matching numbers), then counting them all.

  ## Examples

      AdventOfCode2023.Puzzle4Part2.Solver.run("resources/puzzle4_input.txt")

  """
  def run(puzzle_filename) do
    InputReader.stream_as_strings(puzzle_filename)
    |> Enum.into([], fn line -> Parser.parse(line) end)
    |> Processor.copy_cards_with_matching_numbers()
    |> Enum.map(fn %CardCounter{count: count} -> count end)
    |> Enum.sum
    |> (fn solution ->
      Logger.info("Puzzle 4 part 2 : solution = #{solution}")
      solution
    end).()
  end

end
