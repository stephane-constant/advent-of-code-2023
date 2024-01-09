defmodule AdventOfCode2023.Puzzle2Part2.ProcessorTest do
  use ExUnit.Case, async: true

  alias AdventOfCode2023.Puzzle2Part2.Processor
  alias AdventOfCode2023.Puzzle2.{Game, CubesSet}

  test "Puzzle2Part2.Processor.compute_cubes_power returns expected total" do
    assert 1560 == Processor.compute_cubes_power(%CubesSet{blue: 6, red: 20, green: 13})
  end

  test "Puzzle2Part2.Processor.compute_cubes_power handles color value 0" do
    assert 45 == Processor.compute_cubes_power(%CubesSet{blue: 15, green: 3, red: 0})
    assert 18 == Processor.compute_cubes_power(%CubesSet{blue: 0, red: 6, green: 3})
    assert 90 == Processor.compute_cubes_power(%CubesSet{blue: 15, red: 6, green: 0})
  end

  test "Puzzle2Part2.Processor.compute_cubes_power handles missing color value" do
    assert 45 == Processor.compute_cubes_power(%CubesSet{blue: 15, green: 3})
    assert 18 == Processor.compute_cubes_power(%CubesSet{red: 6, green: 3})
    assert 90 == Processor.compute_cubes_power(%CubesSet{blue: 15, red: 6})
  end

  test "Puzzle2Part2.Processor.find_fewest_cubes_per_game returns expected values per color" do
    game = %Game{
      id: 1,
      cubes_sets: [
        %CubesSet{blue: 3, red: 4},
        %CubesSet{blue: 6, red: 1, green: 2},
        %CubesSet{green: 2}
      ]
    }

    expected_fewest_numbers_of_cubes = %CubesSet{blue: 6, red: 4, green: 2}

    assert expected_fewest_numbers_of_cubes == Processor.find_fewest_cubes_per_game(game)
  end

end