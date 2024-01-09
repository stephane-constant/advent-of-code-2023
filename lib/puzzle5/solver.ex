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
  Solves puzzle 5 by extracting and processing conversion ranges one after the other,
  then return the lowest location.

  ## Examples

      AdventOfCode2023.Puzzle5.Solver.run("resources/puzzle5_input.txt")

  """
  def run(puzzle_filename) do

    with [head | tail] <- InputReader.stream_as_strings(puzzle_filename),
         seeds <- Parser.parse_seeds(head),
         ranges_1 <- Parser.extract_ranges(tail, @seed_to_soil),
         ranges_2 <- Parser.extract_ranges(tail, @soil_to_fertilizer),
         ranges_3 <- Parser.extract_ranges(tail, @fertilizer_to_water),
         ranges_4 <- Parser.extract_ranges(tail, @water_to_light),
         ranges_5 <- Parser.extract_ranges(tail, @light_to_temperature),
         ranges_6 <- Parser.extract_ranges(tail, @temperature_to_humidity),
         ranges_7 <- Parser.extract_ranges(tail, @humidity_to_location)
      do

      solution = Processor.from_sources_to_destinations(seeds, ranges_1)
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
      |> Enum.sort
      |> List.first

      Logger.info("Puzzle 5 : solution = #{solution}")
      solution
    end
  end

end
