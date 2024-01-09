defmodule AdventOfCode2023.Puzzle5.SolverTest do
  use ExUnit.Case, async: true

  alias AdventOfCode2023.Puzzle5.Solver

  test "Puzzle5.Solver can solve the small input file" do
    assert Solver.run("resources/puzzle5_input_small.txt") == 35
  end

  test "Puzzle5.Solver can solve the full input file" do
    assert Solver.run("resources/puzzle5_input.txt") == 57075758
  end

end
