defmodule Puzzle1SolverTest do
  use ExUnit.Case
  doctest Puzzle1Solver

  test "Puzzle1Solver can solve the test input" do
    assert Puzzle1Solver.run("test/puzzle_1_solver/puzzle_1_input_test.txt") == 142
  end
end
