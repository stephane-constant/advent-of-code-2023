defmodule Puzzle1Part2SolverTest do
  use ExUnit.Case, async: true

  alias AdventOfCode2023.Puzzle1Part2Solver

  doctest Puzzle1Part2Solver

  test "Puzzle1Part2Solver can solve the test input file" do
    assert Puzzle1Part2Solver.run("test/resources/puzzle_1_test_input.txt") == 281
  end
end
