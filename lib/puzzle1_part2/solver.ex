defmodule AdventOfCode2023.Puzzle1Part2.Solver do
  require Logger

  alias AdventOfCode2023.Common.InputReader
  alias AdventOfCode2023.Puzzle1Part2.Parser

  @moduledoc false

  @doc """
  Solves puzzle 1 part 2 with hardened line parsing than part 1, and sum them all.

  ## Examples

      AdventOfCode2023.Puzzle1Part2.Solver.run("resources/puzzle1_input.txt")

  """
  # TODO : spawn parallel process per puzzle line to fasten the solution
  def run(puzzle_filename) do
    InputReader.stream_as_strings(puzzle_filename)
    |> Enum.into([], fn line -> Parser.parse(line) end)
    |> Enum.sum
    |> (fn solution ->
      Logger.info("Puzzle 1 part 2 : solution = #{solution}")
      solution
    end).()
  end
end
