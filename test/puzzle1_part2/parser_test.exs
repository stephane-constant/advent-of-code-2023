defmodule AdventOfCode2023.Puzzle1Part2.Parser.Test do
  use ExUnit.Case, async: true

  alias AdventOfCode2023.Puzzle1Part2.Parser

  doctest Parser

  test "Puzzle1Part2.Parser can parse the test lines" do
    lines = [
      "two1nine", "eightwothree", "abcone2threexyz", "xtwone3four",
      "4nineeightseven2", "zoneight234", "7pqrstsixteen"
    ]
    expected_values = [29, 83, 13, 24, 42, 14, 76]

    Enum.zip(lines, expected_values)
    |> Enum.map(fn {line, expected_value} ->
      assert Parser.parse(line) == expected_value
    end)
  end
end
