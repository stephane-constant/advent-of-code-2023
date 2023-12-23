defmodule AdventOfCode2023.Puzzle4.ParserTest do
  use ExUnit.Case

  alias AdventOfCode2023.Puzzle4.Parser
  alias AdventOfCode2023.Puzzle4.{Card}

  test "Puzzle4.Parser can parse a simple test line" do
    line = "Card  1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53"

    assert %Card{id: 1, winning_numbers: winning_numbers, numbers: numbers} = Parser.parse(line)
    assert [41, 48, 83, 86, 17] == winning_numbers
    assert [83, 86, 6, 31, 17, 9, 48, 53] == numbers
  end

end
