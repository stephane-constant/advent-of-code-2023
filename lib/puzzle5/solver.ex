defmodule AdventOfCode2023.Puzzle5.Solver do
  require Logger

  alias AdventOfCode2023.Common.{InputReader, OutputWriter}
  alias AdventOfCode2023.Puzzle5.{Parser, Processor}

  @seed_to_soil "seed-to-soil"
  @soil_to_fertilizer "soil-to-fertilizer"
  @fertilizer_to_water "fertilizer-to-water"
  @water_to_light "water-to-light"
  @light_to_temperature "light-to-temperature"
  @temperature_to_humidity "temperature-to-humidity"
  @humidity_to_location "humidity-to-location"

  @doc """
  Solves puzzle 5 part 1 by extracting and processing conversion ranges one after the other,
  then return the lowest location.

  ## Examples

      AdventOfCode2023.Puzzle5.Solver.run_part1("resources/puzzle5_input.txt")

  """
  def run_part1(puzzle_filename) do
    [seeds_line | ranges_lines] = InputReader.stream_as_strings(puzzle_filename)
    seeds = Parser.parse_seeds_for_part1(seeds_line)
    OutputWriter.write_structs(seeds, "0_seeds_part1.txt")

    solution = _compute_lowest_location(seeds, ranges_lines)
    Logger.info("Puzzle 5 part 1 : solution = #{solution}")
    solution
  end

  @doc """
  Solves puzzle 5 part 2 by extracting and processing conversion ranges one after the other,
  then return the lowest location. The only difference with part 1 is parsing seeds (ranges instead of single values).

  ## Examples

      AdventOfCode2023.Puzzle5.Solver.run_part2("resources/puzzle5_input.txt")

  """
  def run_part2(puzzle_filename) do
    [seeds_line | ranges_lines] = InputReader.stream_as_strings(puzzle_filename)
    seeds = Parser.parse_seeds_for_part2(seeds_line)
    OutputWriter.write_structs(seeds, "0_seeds_part2.txt")

    solution = _compute_lowest_location(seeds, ranges_lines)
    Logger.info("Puzzle 5 part 2 : solution = #{solution}")
    solution
  end

  defp _compute_lowest_location(seeds, ranges_lines) do
    with ranges_1 <- Parser.extract_ranges(ranges_lines, @seed_to_soil),
         ranges_2 <- Parser.extract_ranges(ranges_lines, @soil_to_fertilizer),
         ranges_3 <- Parser.extract_ranges(ranges_lines, @fertilizer_to_water),
         ranges_4 <- Parser.extract_ranges(ranges_lines, @water_to_light),
         ranges_5 <- Parser.extract_ranges(ranges_lines, @light_to_temperature),
         ranges_6 <- Parser.extract_ranges(ranges_lines, @temperature_to_humidity),
         ranges_7 <- Parser.extract_ranges(ranges_lines, @humidity_to_location) do
      Processor.from_sources_to_destinations(seeds, ranges_1)
      |> OutputWriter.write_structs("1_soil_destinations.txt")
      |> Processor.from_sources_to_destinations(ranges_2)
      |> OutputWriter.write_structs("2_fertilizer_destinations.txt")
      |> Processor.from_sources_to_destinations(ranges_3)
      |> OutputWriter.write_structs("3_water_destinations.txt")
      |> Processor.from_sources_to_destinations(ranges_4)
      |> OutputWriter.write_structs("4_light_destinations.txt")
      |> Processor.from_sources_to_destinations(ranges_5)
      |> OutputWriter.write_structs("5_temperatures_destinations.txt")
      |> Processor.from_sources_to_destinations(ranges_6)
      |> OutputWriter.write_structs("6_humidity_destinations.txt")
      |> Processor.from_sources_to_destinations(ranges_7)
      |> OutputWriter.write_structs("7_location_destinations.txt")
      |> Enum.sort()
      |> List.first()
    end
  end
end
