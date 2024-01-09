defmodule AdventOfCode2023.Puzzle5.ParserTest do
  use ExUnit.Case, async: true

  alias AdventOfCode2023.Puzzle5.Parser
  alias AdventOfCode2023.Puzzle5.ConversionRange

  test "Puzzle5.Parser can parse seeds" do
    line = "seeds: 79 14 55 13"

    assert [79, 14, 55, 13] = Parser.parse_seeds(line)
  end

  test "Puzzle5.Parser can extract ranges for the given range name" do

    lines = [
      "seed-to-soil map:",
      "50 98 2",
      "52 50 48",
      "",
      "soil-to-fertilizer map:",
      "0 15 37",
      "37 52 2",
      "39 0 15"
    ]

    ranges_1 = Parser.extract_ranges(lines, "seed-to-soil")
    assert length(ranges_1) == 2
    assert Enum.at(ranges_1, 0) == %ConversionRange{
             destination_range_start: 52,
             source_range_start: 50,
             range_length: 48
           } # Reminder : ranges are sorted by source range start

    ranges_2 = Parser.extract_ranges(lines, "soil-to-fertilizer")
    assert length(ranges_2) == 3
    assert Enum.at(ranges_2, 0) == %ConversionRange{
             destination_range_start: 39,
             source_range_start: 0,
             range_length: 15
           } # Reminder : ranges are sorted by source range start
  end

end
