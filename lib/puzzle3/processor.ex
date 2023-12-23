defmodule AdventOfCode2023.Puzzle3.Processor do

  alias AdventOfCode2023.Puzzle3.{PartNumber, Symbol}

  @gear_ratio_symbol "*"

  # Loop upon part numbers, and check with all symbols' coordinates +1/-1 on x and y
  def find_part_numbers_adjacent_to_symbols([], _symbols), do: []

  def find_part_numbers_adjacent_to_symbols(_part_numbers, []), do: []

  def find_part_numbers_adjacent_to_symbols(part_numbers, symbols) do
    part_numbers |> Enum.filter(&adjacent_with_any?(&1, symbols))
  end

  defp adjacent_with_any?(part_number, symbols) do
    Enum.any?(symbols, fn symbol -> adjacent?(part_number, symbol) end)
  end

  defp adjacent?(%PartNumber{value: pn_value, x: pn_x, y: pn_y}, %Symbol{x: s_x, y: s_y}) do
    pn_length = String.length(pn_value)
    result = pn_y + 1 >= s_y and s_y >= pn_y - 1 and pn_x + pn_length >= s_x and s_x >= pn_x - 1
    #    IO.puts("result for #{pn_value} with symbol #{s_x}/#{s_y} : #{result}")
    result
  end

  def sum_part_number_values(part_numbers), do: sum(part_numbers)

  defp sum([]), do: 0

  defp sum([%PartNumber{value: value} | tail]), do: String.to_integer(value) + sum(tail)

  def find_gears(part_numbers, symbols) do
    symbols
    |> Enum.filter(fn %Symbol{character: character} -> character == @gear_ratio_symbol end)
    |> Enum.map(&find_ratios_and_compute_gears(&1, part_numbers))
    |> Enum.filter(fn gear -> gear != 0 end)
  end

  defp find_ratios_and_compute_gears(symbol, part_numbers) do
    adjacent_part_numbers = part_numbers |> Enum.filter(&adjacent?(&1, symbol))
    case length(adjacent_part_numbers) do
      2 ->
        adjacent_part_numbers
        |> Enum.map(fn %PartNumber{value: v} -> String.to_integer(v) end)
        |> Enum.reduce(1, fn value, acc -> value * acc end)
      _ -> 0
    end
  end

end
