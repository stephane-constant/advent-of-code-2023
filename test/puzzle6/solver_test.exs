defmodule AdventOfCode2023.Puzzle6.SolverTest do
  use ExUnit.Case, async: true

  alias AdventOfCode2023.Puzzle6.Solver

  test "Puzzle6.Solver can solve the small input file" do
    # 288 <- 4 * 8 * 9
    assert Solver.run("resources/puzzle6_input_small.txt") == 288
  end

  test "Puzzle6.Solver can solve the full input file" do
    assert Solver.run("resources/puzzle6_input.txt") == 211_904
  end

  test "Puzzle6.Solver can solve the small Part2 input file" do
    assert Solver.run("resources/puzzle6_part2_input_small.txt") == 71503
  end

  # Warning : this one alone takes about 15sec
  #  test "Puzzle6.Solver can solve the full Part2 input file" do
  #    assert Solver.run("resources/puzzle6_part2_input.txt") == 43_364_472
  #  end
end
