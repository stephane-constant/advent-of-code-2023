defmodule AdventOfCode2023.Puzzle2.SolverTest do
  use ExUnit.Case, async: true

  alias AdventOfCode2023.Puzzle2.Solver

  test "Puzzle2.Solver can solve the small input file" do
    assert Solver.run("resources/puzzle2_input_small.txt") == 8
  end

  test "Puzzle2.Solver can solve the full input file" do
    assert Solver.run("resources/puzzle2_input.txt") == 2505
  end

end
