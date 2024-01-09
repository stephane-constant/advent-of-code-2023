defmodule AdventOfCode2023.Puzzle6.ParserTest do
  use ExUnit.Case, async: true

  alias AdventOfCode2023.Puzzle6.Parser

  test "Puzzle6.Parser can parse times and distances" do
    lines = [
      "Time:      7  15   30",
      "Distance:  9  40  200"
    ]

    assert [{7, 9}, {15, 40}, {30, 200}] = Parser.parse_times_and_distances(lines)
  end
end
