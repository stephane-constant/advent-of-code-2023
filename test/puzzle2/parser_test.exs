defmodule AdventOfCode2023.Puzzle2.ParserTest do
  use ExUnit.Case

  alias AdventOfCode2023.Puzzle2.Parser
  alias AdventOfCode2023.Puzzle2.{Game, CubesSet}

  doctest Parser

  test "Puzzle2.Parser can parse a simple test line" do
    line = "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green"

    assert %Game{id: 1, cubes_sets: cubes_sets} = Parser.parse(line)
    assert length(cubes_sets) == 3
    assert [
             %CubesSet{blue: 3, red: 4, green: 0},
             %CubesSet{red: 1, green: 2, blue: 6},
             %CubesSet{green: 2, red: 0, blue: 0}
           ] == cubes_sets
  end


end
