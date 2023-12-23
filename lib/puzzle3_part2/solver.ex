defmodule AdventOfCode2023.Puzzle3Part2.Solver do
  require Logger

  alias AdventOfCode2023.Common.{InputReader, OutputWriter}
  alias AdventOfCode2023.Puzzle3.{Parser, Processor}

  @doc """
  Solves puzzle 3 by finding the part numbers adjacent to a symbol, then sum them all.

  ## Examples

      AdventOfCode2023.Puzzle3Part2.Solver.run("resources/puzzle3_input.txt")

  """
  def run(puzzle_filename) do
    with lines_with_index <- InputReader.stream_as_strings_with_index(puzzle_filename),
         part_numbers <- lines_with_index |> Enum.map(&Parser.extract_part_numbers/1),
         symbols <- lines_with_index |> Enum.map(&Parser.extract_symbols/1),
         _ <- OutputWriter.write_structs(Enum.concat(part_numbers), "1_part_numbers.txt"),
         _ <- OutputWriter.write_structs(Enum.concat(symbols), "2_symbols.txt"),
         engine_gears <- Processor.find_gears(Enum.concat(part_numbers), Enum.concat(symbols)),
         _ <- OutputWriter.write_structs(engine_gears, "3_engine_gears.txt"),
         solution <- Enum.sum(engine_gears) do

      Logger.info("Puzzle 3 Part 2 : solution = #{solution}")
      solution
    end
  end

end
