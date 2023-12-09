defmodule AdventOfCode2023.Puzzle2.Solver do
  require Logger

  alias AdventOfCode2023.Common.InputReader
  alias AdventOfCode2023.Puzzle2.{Parser, Processor}

  @doc """
  Solves puzzle 2 by finding the 'possible' games, then sum their IDs.

  ## Examples

      AdventOfCode2023.Puzzle2.Solver.run("resources/puzzle2_input.txt")

  """
  def run(puzzle_filename) do
    InputReader.stream_as_strings(puzzle_filename)
    |> Enum.into([], fn line -> Parser.parse(line) end)
    |> Processor.find_possible_games()
    |> Processor.sum_game_ids()
    |> (fn solution ->
      Logger.info("Puzzle 2 : solution = #{solution}")
      solution
    end).()
  end

end
