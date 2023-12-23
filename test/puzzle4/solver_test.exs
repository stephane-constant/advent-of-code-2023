defmodule AdventOfCode2023.Puzzle4.SolverTest do
  use ExUnit.Case, async: true

  alias AdventOfCode2023.Puzzle4.Solver

  test "Puzzle4.Solver can solve the small input file" do
    assert Solver.run("resources/puzzle4_input_small.txt") == 13
  end

  test "Puzzle4.Solver can solve the full input file" do
    assert Solver.run("resources/puzzle4_input.txt") == 18519
  end

end
