defmodule AdventOfCode2023.Puzzle3.ParserTest do
  use ExUnit.Case

  alias AdventOfCode2023.Puzzle3.Parser
  alias AdventOfCode2023.Puzzle3.{PartNumber, Symbol}

  test "Puzzle3.Parser can extract part numbers from a simple line" do
    part_numbers = Parser.extract_part_numbers({"467..114..", 1})

    assert 2 == length(part_numbers)
    assert [
            %PartNumber{value: 467, x: 0, y: 1},
            %PartNumber{value: 114, x: 5, y: 1}
           ] = part_numbers
  end

  test "Puzzle3.Parser can extract part numbers from a line with symbols" do
    part_numbers = Parser.extract_part_numbers({"617*......", 2})

    assert 1 == length(part_numbers)
    assert [%PartNumber{value: 617, x: 0, y: 2}] = part_numbers
  end

  test "Puzzle3.Parser can manage a line without part number" do
    part_numbers = Parser.extract_part_numbers({"...*......", 3})

    assert 0 == length(part_numbers)
  end

  test "Puzzle3.Parser can extract symbols from a simple line" do
    symbols = Parser.extract_symbols({"...$.*....", 4})

    assert 2 == length(symbols)
    assert [
             %Symbol{x: 3, y: 4},
             %Symbol{x: 5, y: 4}
           ] = symbols
  end

  test "Puzzle3.Parser can extract symbols from a line with part numbers" do
    symbols = Parser.extract_symbols({".....+.58.", 5})

    assert 1 == length(symbols)
    assert [%Symbol{x: 5, y: 5}] = symbols
  end

  test "Puzzle3.Parser can manage a line without symbol" do
    symbols = Parser.extract_symbols({"..35..633.", 6})

    assert 0 == length(symbols)
  end

end
