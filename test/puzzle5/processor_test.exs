defmodule AdventOfCode2023.Puzzle5.ProcessorTest do
  use ExUnit.Case, async: true

  alias AdventOfCode2023.Puzzle5.Processor
  alias AdventOfCode2023.Puzzle5.ConversionRange

  test "Puzzle5.Processor.from_sources_to_destinations maps sources to destinations according to ranges" do
    seed_to_soil_ranges = [
      %ConversionRange{destination_range_start: 52, source_range_start: 50, range_length: 48},
      %ConversionRange{destination_range_start: 50, source_range_start: 98, range_length: 2}
    ]

    seeds = [79, 14, 55, 13]

    assert [13, 14, 57, 81] == Processor.from_sources_to_destinations(seeds, seed_to_soil_ranges)
  end

end
