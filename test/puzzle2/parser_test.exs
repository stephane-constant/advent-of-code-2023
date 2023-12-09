defmodule AdventOfCode2023.Puzzle2.ParserTest do
  use ExUnit.Case

  alias AdventOfCode2023.Puzzle2.Parser

  doctest Parser

  test "Puzzle2.Parser can parse a simple test line" do
    line = "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green"

    assert %{"id" => "1", "cubes_sets" => cubes_sets} = Parser.parse(line)
    assert length(cubes_sets) == 3

    assert %{"blue" => "3", "red" => "4"} = Enum.at(cubes_sets, 0)
    assert %{"red" => "1", "green" => "2", "blue" => "6"} = Enum.at(cubes_sets, 1)
    assert %{"green" => "2"} = Enum.at(cubes_sets, 2)
  end


end
