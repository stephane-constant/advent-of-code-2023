defmodule AdventOfCode2023.Puzzle5.Parser do
  require Logger

  alias AdventOfCode2023.Puzzle5.ConversionRange

  def parse_seeds_for_part1("seeds: " <> seeds) do
    String.split(seeds, " ") |> Enum.map(&String.to_integer/1)
  end

  def parse_seeds_for_part2("seeds: " <> seeds) do
    String.split(seeds, " ")
    |> Enum.chunk_every(2)
    |> Enum.map(fn [a, b] ->
      range_min = String.to_integer(a)
      range_max = range_min + String.to_integer(b) - 1
      Enum.to_list(range_min..range_max)
    end)
    |> List.flatten()
  end

  def extract_ranges([head | tail], map_name) when head == map_name <> " map:" do
    _parse_ranges(tail, [])
  end

  def extract_ranges([_ | tail], map_name) do
    extract_ranges(tail, map_name)
  end

  defp _parse_ranges([], previous_ranges) do
    previous_ranges |> Enum.sort_by(& &1.source_range_start)
  end

  defp _parse_ranges([head | _], previous_ranges) when head == "" do
    previous_ranges |> Enum.sort_by(& &1.source_range_start)
  end

  defp _parse_ranges([head | tail], previous_ranges) do
    [destination_range_start, source_range_start, range_length] = String.split(head, " ")

    new_range = %ConversionRange{
      destination_range_start: String.to_integer(destination_range_start),
      source_range_start: String.to_integer(source_range_start),
      range_length: String.to_integer(range_length)
    }

    _parse_ranges(tail, [new_range | previous_ranges])
  end
end
