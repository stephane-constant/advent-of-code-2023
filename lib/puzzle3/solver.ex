defmodule AdventOfCode2023.Puzzle3.Solver do
  require Logger

  alias AdventOfCode2023.Common.{InputReader, OutputWriter}
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
         _ <- OutputWriter.write_structs(Enum.concat(part_numbers), "1_part_numbers.txt"),
         _ <- OutputWriter.write_structs(Enum.concat(symbols), "2_symbols.txt"),
         engine_part_numbers <- Processor.find_part_numbers_adjacent_to_symbols(Enum.concat(part_numbers), Enum.concat(symbols)),
         _ <- OutputWriter.write_structs(engine_part_numbers, "3_engine_parts.txt"),
         solution <- Processor.sum_part_number_values(engine_part_numbers) do

      Logger.info("Puzzle 3 : solution = #{solution}")
      solution
    end
  end

end
