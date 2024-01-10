defmodule AdventOfCode2023.Puzzle5.SolverTest do
  use ExUnit.Case, async: true

  alias AdventOfCode2023.Puzzle5.Solver

  test "Puzzle5.Solver can solve part 1 with the small input file" do
    assert Solver.run_part1("resources/puzzle5_input_small.txt") == 35
  end

  test "Puzzle5.Solver can solve part 1 with the full input file" do
    assert Solver.run_part1("resources/puzzle5_input.txt") == 57_075_758
  end

  test "Puzzle5.Solver can solve part 2 with the small input file" do
    assert Solver.run_part2("resources/puzzle5_input_small.txt") == 46
  end

  # Warning : process stopped, brut force is not a good idea
#  test "Puzzle5.Solver can solve part 2 with the full input file" do
#    assert Solver.run_part2("resources/puzzle5_input.txt") == 1
#  end
end
