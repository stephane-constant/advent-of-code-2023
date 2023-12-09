defmodule AdventOfCode2023.Puzzle2Part2.Solver do
  require Logger

  alias AdventOfCode2023.Common.InputReader
  alias AdventOfCode2023.Puzzle2.{Parser, Processor}

  @doc """
  Solves puzzle 2 part 2 by finding the fewest number of cubes of each color
  (in every game, not only the 'possible' ones), then multiply together, then sum for all games.

  ## Examples

      AdventOfCode2023.Puzzle2Part2.Solver.run("resources/puzzle2_input.txt")
      is expected to return xxx

  """
  def run(puzzle_filename) do
    InputReader.stream_as_strings(puzzle_filename)
    |> Enum.into([], fn line -> Parser.parse(line) end)
    |> Processor.find_possible_games() # NOT OK
    |> Processor.sum_game_ids() # NOT OK
    |> (fn solution ->
      Logger.info("Puzzle 2 : solution = #{solution}")
      solution
    end).()
  end

end
