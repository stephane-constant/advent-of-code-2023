defmodule Puzzle1SolverTest do
  use ExUnit.Case
  doctest Puzzle1Solver

  test "Puzzle1Solver can solve the test input file" do
    assert Puzzle1Solver.run("test/resources/puzzle_1_test_input.txt") == 142
  end
end
