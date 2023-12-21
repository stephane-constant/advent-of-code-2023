defmodule AdventOfCode2023.Puzzle3.Processor do

  alias AdventOfCode2023.Puzzle3.{PartNumber, Symbol}

  # Loop upon part numbers, and check with all symbols' coordinates +1/-1 on x and y
  def find_part_numbers_adjacent_to_symbols([], _symbols), do: []

  def find_part_numbers_adjacent_to_symbols(_part_numbers, []), do: []

  def find_part_numbers_adjacent_to_symbols(part_numbers, symbols) do
    part_numbers |> Enum.filter(&adjacent_with_any?(&1, symbols))
  end

  defp adjacent_with_any?(%PartNumber{y: pn_y} = part_number, symbols) do
    # Keep the symbols potentially adjacent, ie on the line above / equal / below the part number
    potentially_adjacent_symbols = symbols |> Enum.filter(fn %Symbol{y: s_y} -> pn_y + 1 >= s_y and s_y >= pn_y - 1 end)
    Enum.any?(potentially_adjacent_symbols, fn symbol -> adjacent?(part_number, symbol) end)
  end

  # Return true when symbol is adjacent, ie on the left / middle / right side of the part number
  defp adjacent?(%PartNumber{value: pn_value, x: pn_x}, %Symbol{x: s_x}) do
    pn_length = String.length(pn_value)
    pn_x + pn_length + 1 >= s_x and s_x >= pn_x - 1
  end

  def sum_part_number_values(part_numbers), do: sum(part_numbers)

  defp sum([]), do: 0

  defp sum([%PartNumber{value: value} | tail]), do: String.to_integer(value) + sum(tail)

end
