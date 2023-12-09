defmodule AdventOfCode2023.Puzzle2.Solver do
  require Logger

  alias AdventOfCode2023.Common.InputReader
  alias AdventOfCode2023.Puzzle2.{Parser, Processor}

  @moduledoc false

  @doc """
  Solves puzzle 2.

  ## Examples

      AdventOfCode2023.Puzzle2.Solver.run("resources/puzzle2_input.txt")
      is expected to return xxx

  """
  def run(puzzle_filename) do
    InputReader.stream_as_strings(puzzle_filename)
    |> Enum.into([], fn line -> Parser.parse(line) end)
    |> Processor.sum_possible_game_ids()
#    |> Enum.map(fn game -> Processor.sum_possible_game_id(game) end)
#    |> Enum.reduce(0, fn game_id, sum -> game_id + sum end)
    |> (fn solution ->
      Logger.info("Puzzle 2 : solution = #{solution}")
      solution
    end).()
  end

end
