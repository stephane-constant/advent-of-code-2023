defmodule AdventOfCode2023.Puzzle1.SolverTest do
  use ExUnit.Case, async: true

  alias AdventOfCode2023.Puzzle1.Solver

  test "Puzzle1.Solver can solve the small input file" do
    assert Solver.run("resources/puzzle1_input_small.txt") == 142
  end

  test "Puzzle1.Solver can solve the full input file" do
    assert Solver.run("resources/puzzle1_input.txt") == 55208
  end
end
