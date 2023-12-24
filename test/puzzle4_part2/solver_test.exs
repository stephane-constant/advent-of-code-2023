defmodule AdventOfCode2023.Puzzle4Part2.SolverTest do
  use ExUnit.Case, async: true

  alias AdventOfCode2023.Puzzle4Part2.Solver

  test "Puzzle4Part2.Solver can solve the small input file" do
    assert Solver.run("resources/puzzle4_input_small.txt") == 30
  end

  test "Puzzle4Part2.Solver can solve the full input file" do
    assert Solver.run("resources/puzzle4_input.txt") == 11787590
  end

end
