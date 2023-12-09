defmodule AdventOfCode2023.Puzzle2Part2.SolverTest do
  use ExUnit.Case, async: true

  alias AdventOfCode2023.Puzzle2Part2.Solver

  doctest Solver

  test "Puzzle2Part2.Solver can solve the small input file" do
    assert Solver.run("resources/puzzle2_input_small.txt") == 2286
  end

  test "Puzzle2Part2.Solver can solve the full input file" do
    assert Solver.run("resources/puzzle2_input.txt") == 70265
  end

end
