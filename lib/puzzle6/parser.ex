defmodule AdventOfCode2023.Puzzle6.Parser do
  require Logger

  @doc """
  Parses the 2 input lines, and returns a list of tuples {race_time, record_distance}.
  """
  def parse_times_and_distances([times_line | distances_line]) do
    "Time: " <> times_string = times_line
    race_times = String.split(times_string, " ", trim: true) |> Enum.map(&String.to_integer/1)

    "Distance: " <> distances_string = Enum.at(distances_line, 0)

    record_distances =
      String.split(distances_string, " ", trim: true) |> Enum.map(&String.to_integer/1)

    List.zip([race_times, record_distances])
  end
end
