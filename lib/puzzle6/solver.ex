defmodule AdventOfCode2023.Puzzle6.Solver do
  require Logger

  alias AdventOfCode2023.Common.InputReader
  alias AdventOfCode2023.Puzzle6.{Parser, Worker, Coordinator}

  @doc """
  Solves puzzle 6 by parsing race times and record distances,
  launching a Worker process per race (to count the winning races),
  launching a Coordinator process to collect and return all results,
  then multiply the results.

  ## Examples

      AdventOfCode2023.Puzzle6.Solver.run("resources/puzzle6_input.txt")

  """
  def run(puzzle_filename) do
    times_distances =
      InputReader.read_as_strings(puzzle_filename)
      |> Parser.parse_times_and_distances()

    coordinator_pid = spawn(Coordinator, :loop, [self(), [], Enum.count(times_distances)])

    times_distances
    |> Enum.each(fn {race_time, record_distance} ->
      worker_pid = spawn(Worker, :loop, [])
      send(worker_pid, {coordinator_pid, race_time, record_distance})
    end)

    receive do
      {:ok, winning_races_counts} ->
        List.foldl(winning_races_counts, 1, fn x, acc -> x * acc end)
    end
  end
end
