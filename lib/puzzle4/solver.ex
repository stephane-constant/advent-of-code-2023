defmodule AdventOfCode2023.Puzzle4.Solver do
  require Logger

  alias AdventOfCode2023.Common.InputReader
  alias AdventOfCode2023.Puzzle4.{Parser, Processor}

  @doc """
  Solves puzzle 4 by finding the winning numbers, then double the points, then sum them all.

  ## Examples

      AdventOfCode2023.Puzzle4.Solver.run("resources/puzzle4_input.txt")

  """
  def run(puzzle_filename) do
    InputReader.stream_as_strings(puzzle_filename)
    |> Enum.into([], fn line -> Parser.parse(line) end)
    |> Enum.map(&Processor.compute_card_points/1)
    |> Enum.sum
    |> (fn solution ->
      Logger.info("Puzzle 4 : solution = #{solution}")
      solution
    end).()
  end

end
