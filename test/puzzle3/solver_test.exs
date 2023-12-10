defmodule AdventOfCode2023.Puzzle3.SolverTest do
  use ExUnit.Case, async: true

  alias AdventOfCode2023.Puzzle3.Solver

  doctest Solver

  test "Puzzle3.Solver can solve the small input file" do
    assert Solver.run("resources/puzzle3_input_small.txt") == 4361
  end

#  test "Puzzle3.Solver can solve the full input file" do
#    assert Solver.run("resources/puzzle3_input.txt") == 70265
#  end

end
