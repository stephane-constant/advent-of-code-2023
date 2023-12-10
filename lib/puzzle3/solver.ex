defmodule AdventOfCode2023.Puzzle3.Solver do
  require Logger

  alias AdventOfCode2023.Common.InputReader
  alias AdventOfCode2023.Puzzle3.{Parser, Processor}

  @doc """
  Solves puzzle 3 by finding the part numbers adjacent to a symbol, then sum them all.

  ## Examples

      AdventOfCode2023.Puzzle3.Solver.run("resources/puzzle3_input.txt")

  """
  def run(puzzle_filename) do
    with lines_with_index <- InputReader.stream_as_strings_with_index(puzzle_filename),
         part_numbers <- lines_with_index |> Enum.map(&Parser.extract_part_numbers/1),
         symbols <- lines_with_index |> Enum.map(&Parser.extract_symbols/1),
         engine_part_numbers <- Processor.find_part_numbers_adjacent_to_symbols(part_numbers, symbols),
         solution <- Processor.sum_part_numbers(engine_part_numbers) do

      Logger.info("Puzzle 3 : solution = #{solution}")
      solution
    end
  end

end
