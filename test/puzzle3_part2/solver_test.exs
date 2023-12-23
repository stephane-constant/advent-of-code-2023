defmodule AdventOfCode2023.Puzzle3Part2.SolverTest do
  use ExUnit.Case, async: true

  alias AdventOfCode2023.Puzzle3Part2.Solver

  doctest Solver

  test "Puzzle3Part2.Solver can solve the small input file" do
    assert Solver.run("resources/puzzle3_input_small.txt") == 467835
  end

  test "Puzzle3Part2.Solver can solve the full input file" do
    assert Solver.run("resources/puzzle3_input.txt") == 84266818
  end

end
