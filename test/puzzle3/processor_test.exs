defmodule ProcessorTest do
  use ExUnit.Case

  alias AdventOfCode2023.Puzzle3.Processor
  alias AdventOfCode2023.Puzzle3.{PartNumber, Symbol}

  # Directly inspired from puzzle3_input_small.txt
  test "Puzzle3.Processor.find_part_numbers_adjacent_to_symbols returns part numbers with a symbol below" do
    part_numbers = [
      %PartNumber{value: "467", x: 0, y: 0},
      %PartNumber{value: "114", x: 5, y: 0},
    ]

    symbols = [%Symbol{x: 3, y: 1}, %Symbol{x: 6, y: 3}]

    assert [%PartNumber{value: "467", x: 0, y: 0}] == Processor.find_part_numbers_adjacent_to_symbols(part_numbers, symbols)
  end

  test "Puzzle3.Processor.find_part_numbers_adjacent_to_symbols returns part numbers with a symbol above" do
    part_numbers = [
      %PartNumber{value: "467", x: 0, y: 0},
      %PartNumber{value: "633", x: 6, y: 3},
    ]

    symbols = [%Symbol{x: 7, y: 2}]

    assert [%PartNumber{value: "633", x: 6, y: 3}] == Processor.find_part_numbers_adjacent_to_symbols(part_numbers, symbols)
  end

  test "Puzzle3.Processor.find_part_numbers_adjacent_to_symbols returns part number with a symbol to its left" do
    part_numbers = [
      %PartNumber{value: "617", x: 0, y: 4},
      %PartNumber{value: "114", x: 4, y: 0},
    ]

    symbols = [%Symbol{x: 3, y: 0}]

    assert [%PartNumber{value: "114", x: 4, y: 0}] == Processor.find_part_numbers_adjacent_to_symbols(part_numbers, symbols)
  end

  test "Puzzle3.Processor.find_part_numbers_adjacent_to_symbols returns part number with a symbol to its right" do
    part_numbers = [
      %PartNumber{value: "617", x: 0, y: 4},
      %PartNumber{value: "114", x: 4, y: 0},
    ]

    symbols = [%Symbol{x: 3, y: 4}]

    assert [%PartNumber{value: "617", x: 0, y: 4}] == Processor.find_part_numbers_adjacent_to_symbols(part_numbers, symbols)
  end

  test "Puzzle3.Processor.find_part_numbers_adjacent_to_symbols returns empty list when no part number is adjacent" do
    part_numbers = [
      %PartNumber{value: "467", x: 0, y: 2},
      %PartNumber{value: "114", x: 10, y: 2},
    ]

    symbols = [
      %Symbol{x: 0, y: 0},
      %Symbol{x: 5, y: 2},
      %Symbol{x: 14, y: 2},
      %Symbol{x: 10, y: 4}
    ]

    assert [] == Processor.find_part_numbers_adjacent_to_symbols(part_numbers, symbols)
  end

  test "Puzzle3.Processor.find_part_numbers_adjacent_to_symbols returns empty list when no symbol" do
    part_numbers = [
      %PartNumber{value: "467", x: 0, y: 0},
      %PartNumber{value: "114", x: 5, y: 0},
    ]

    assert [] == Processor.find_part_numbers_adjacent_to_symbols(part_numbers, [])
  end

  test "Puzzle3.Processor.find_part_numbers_adjacent_to_symbols returns empty list when no part number" do
    symbols = [%Symbol{x: 6, y: 3}]

    assert [] == Processor.find_part_numbers_adjacent_to_symbols([], symbols)
  end

  test "Puzzle3.Processor.sum_part_numbers returns the sum of part number values" do
    assert 1135 == Processor.sum_part_number_values([
             %PartNumber{value: "467"},
             %PartNumber{value: "35"},
             %PartNumber{value: "633"}
           ])
  end

  test "Puzzle3.Processor.find_gears does not compute gear ratio when 0 part number adjacent to symbol *" do
    part_numbers = [
      %PartNumber{value: "467", x: 0, y: 0},
      %PartNumber{value: "35", x: 2, y: 2},
    ]

    symbols = [%Symbol{character: "*", x: 10, y: 1}] # too far on the right side

    assert [] = Processor.find_gears(part_numbers, symbols)
  end

  test "Puzzle3.Processor.find_gears does not compute gear ratio when only 1 part number adjacent to symbol *" do
    part_numbers = [
      %PartNumber{value: "467", x: 0, y: 0},
      %PartNumber{value: "35", x: 2, y: 2},
      %PartNumber{value: "617", x: 0, y: 4}, # adjacent part number
    ]

    symbols = [%Symbol{character: "*", x: 3, y: 4}]

    assert [] = Processor.find_gears(part_numbers, symbols)
  end

  test "Puzzle3.Processor.find_gears does not compute gear ratio when more than 2 part numbers adjacent to symbol *" do
    part_numbers = [
      %PartNumber{value: "467", x: 0, y: 0}, # adjacent & above
      %PartNumber{value: "633", x: 4, y: 1}, # adjacent & right side
      %PartNumber{value: "35", x: 2, y: 2}, # adjacent & below
    ]

    symbols = [%Symbol{character: "*", x: 3, y: 1}]

    assert [] = Processor.find_gears(part_numbers, symbols)
  end

  test "Puzzle3.Processor.find_gears does not compute gear ratio when 2 part numbers adjacent to another symbol than *" do
    part_numbers = [
      %PartNumber{value: "467", x: 0, y: 0}, # adjacent & above
      %PartNumber{value: "35", x: 2, y: 2}, # adjacent & below
    ]

    symbols = [%Symbol{character: "@", x: 3, y: 1}]

    assert [] = Processor.find_gears(part_numbers, symbols)
  end

  test "Puzzle3.Processor.find_gears finds a gear (after multiplying its ratios)" do
    part_numbers = [
      %PartNumber{value: "467", x: 0, y: 0},
      %PartNumber{value: "35", x: 2, y: 2},
    ]

    symbols = [
      %Symbol{character: "*", x: 3, y: 1}
    ]

    assert [16345] = Processor.find_gears(part_numbers, symbols)
  end

  test "Puzzle3.Processor.find_gears returns the gears (after multiplying the gear ratios)" do
    part_numbers = [
      %PartNumber{value: "467", x: 0, y: 0}, # adjacent to 1st symbol
      %PartNumber{value: "35", x: 2, y: 2}, # adjacent to 1st symbol
      %PartNumber{value: "755", x: 6, y: 7}, # adjacent to 2d symbol
      %PartNumber{value: "598", x: 5, y: 9}, # adjacent to 2d symbol
    ]

    symbols = [
      %Symbol{character: "*", x: 3, y: 1},
      %Symbol{character: "*", x: 5, y: 8}
    ]

    # 467x35 and 755x598
    assert [16345, 451490] = Processor.find_gears(part_numbers, symbols)
  end

  end
