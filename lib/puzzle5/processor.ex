defmodule AdventOfCode2023.Puzzle5.Processor do
  require Logger

  alias AdventOfCode2023.Puzzle5.ConversionRange

  def from_sources_to_destinations(sources, conversion_ranges) do
    sources
    |> Enum.map(&_map_source_to_destination(&1, conversion_ranges, []))
    |> List.flatten
    |> Enum.sort
  end

  defp _map_source_to_destination(source, [], previous_destinations) do
    Logger.debug("Puzzle 5 : source #{source} not found in ranges, consider as its own destination")
    [source | previous_destinations]
  end

  defp _map_source_to_destination(source, [head | tail], previous_destinations) do
    %ConversionRange{
      destination_range_start: destination_range_start,
      source_range_start: source_range_start,
      range_length: range_length
    } = head

    Logger.debug("Puzzle 5 : compare #{source} with source range start #{source_range_start} and length #{range_length}")

    cond do
      source_range_start <= source and source < source_range_start + range_length ->
        offset = source - source_range_start
        new_destination = destination_range_start + offset
        Logger.debug("Puzzle 5 : found destination #{new_destination} for source #{source} (offset #{offset} added to #{destination_range_start})")
        new_destinations = [new_destination | previous_destinations]
#        IO.inspect(new_destinations, label: "new destinations", charlists: :as_lists)
        new_destinations

      true -> _map_source_to_destination(source, tail, previous_destinations)
    end
  end

end
