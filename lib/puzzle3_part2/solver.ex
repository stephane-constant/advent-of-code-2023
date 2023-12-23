defmodule AdventOfCode2023.Puzzle3Part2.Solver do
  require Logger

  alias AdventOfCode2023.Common.InputReader
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
         _ <- write_to_file(Enum.concat(part_numbers), "1_part_numbers.txt"),
         _ <- write_to_file(Enum.concat(symbols), "2_symbols.txt"),
         engine_gears <- Processor.find_gears(Enum.concat(part_numbers), Enum.concat(symbols)),
         _ <- write_to_file(engine_gears, "3_engine_gears.txt"),
         solution <- Enum.sum(engine_gears) do

      Logger.info("Puzzle 3 Part 2 : solution = #{solution}")
      solution
    end
  end

  defp write_to_file(items, filename) do

    case File.open(Path.join("output", filename), [:write]) do
      {:ok, file} ->
        for item <- items, do: IO.write(file, inspect(item) <> "\n")
        File.close(file)

      {:error, reason} ->
        IO.puts("File not writable because of #{reason}")
    end
  end

end
