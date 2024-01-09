defmodule AdventOfCode2023.Puzzle6.Coordinator do
  require Logger

  def loop(parent_pid, results \\ [], expected_results_count) do
    receive do
      {:ok, result} ->
        new_results = [result | results]

        if expected_results_count == Enum.count(new_results) do
          send(self(), :exit)
        end

        # Recursion
        loop(parent_pid, new_results, expected_results_count)

      :exit ->
        send(parent_pid, {:ok, results})

      # Recursion for any other message kind
      _ ->
        loop(parent_pid, results, expected_results_count)
    end
  end
end
