defmodule AdventOfCode2023.Puzzle6.Worker do
  require Logger

  def loop do
    receive do
      {sender_pid, race_time, record_distance} ->
        send(sender_pid, {:ok, _count_winning_races(race_time, record_distance)})

      _ ->
        IO.puts("Don't know how to process this message")
    end

    # Recursion
    loop()
  end

  defp _count_winning_races(race_time, record_distance) do
    Logger.debug(
      "Count winning races for race time #{race_time} and record distance #{record_distance}"
    )

    Enum.to_list(1..(race_time - 1))
    |> Enum.count(fn waiting_time ->
      _has_boat_gone_farther_than_record?(waiting_time, race_time, record_distance)
    end)
  end

  # Reminder : boat speed (in millimeters per second) is equal to waiting_time
  defp _has_boat_gone_farther_than_record?(waiting_time, race_time, record_distance) do
    boat_move = (race_time - waiting_time) * waiting_time

    Logger.debug(
      "After waiting #{waiting_time}ms, boat has gone #{boat_move}mm vs record of #{record_distance}mm."
    )

    boat_move > record_distance
  end
end
