defmodule AdventOfCode2023.Puzzle1Part2.SolverTest do
  use ExUnit.Case, async: true

  alias AdventOfCode2023.Puzzle1Part2.Solver

  test "Puzzle1Part2.Solver can solve the small input file" do
    assert Solver.run("resources/puzzle1_part2_input_small.txt") == 281
  end

  test "Puzzle1.Solver can solve the full input file" do
    assert Solver.run("resources/puzzle1_input.txt") == 54578
  end
end
