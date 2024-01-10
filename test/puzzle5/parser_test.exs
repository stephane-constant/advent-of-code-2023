defmodule AdventOfCode2023.Puzzle5.ParserTest do
  use ExUnit.Case, async: true

  alias AdventOfCode2023.Puzzle5.Parser
  alias AdventOfCode2023.Puzzle5.ConversionRange

  test "Puzzle5.Parser can parse seeds for part 1" do
    line = "seeds: 79 14 55 13"

    assert [79, 14, 55, 13] = Parser.parse_seeds_for_part1(line)
  end

  test "Puzzle5.Parser can parse seeds for part 2" do
    line = "seeds: 79 14 55 13"

    assert [
             79,
             80,
             81,
             82,
             83,
             84,
             85,
             86,
             87,
             88,
             89,
             90,
             91,
             92,
             55,
             56,
             57,
             58,
             59,
             60,
             61,
             62,
             63,
             64,
             65,
             66,
             67
           ] = Parser.parse_seeds_for_part2(line)
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
           }

    # Reminder : ranges are sorted by source range start

    ranges_2 = Parser.extract_ranges(lines, "soil-to-fertilizer")
    assert length(ranges_2) == 3

    assert Enum.at(ranges_2, 0) == %ConversionRange{
             destination_range_start: 39,
             source_range_start: 0,
             range_length: 15
           }

    # Reminder : ranges are sorted by source range start
  end
end
