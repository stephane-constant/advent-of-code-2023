defmodule AdventOfCode2023.Puzzle3.Parser do

  alias AdventOfCode2023.Puzzle3.{PartNumber, Symbol}

  @period "."
  @end_of_line "\n"

  # Use tail-recursion to identify any first digit, then extract as full part number
  def extract_part_numbers({puzzle_line, line_index}) do
    line_characters = String.graphemes(puzzle_line) |> List.delete(@end_of_line)
    extract_part_numbers(line_characters, line_index, 0, [])
  end

  defp extract_part_numbers([], _line_index, _position, previous_part_numbers) do
    :lists.reverse(previous_part_numbers)
  end

  defp extract_part_numbers([head | tail], line_index, position, previous_part_numbers) do
    case Regex.match?(~r/^\d+$/, head) do
      true ->
        new_number_as_string = Enum.join(extract_full_part_number(tail, [head]))
        new_part_number = %PartNumber{value: new_number_as_string, x: position, y: line_index}
        value_len = String.length(new_number_as_string)
        extract_part_numbers(Enum.drop(tail, value_len - 1), line_index, position + value_len, [new_part_number | previous_part_numbers])

      false -> extract_part_numbers(tail, line_index, position + 1, previous_part_numbers)
    end
  end

  defp extract_full_part_number([], previous_numbers) do
    :lists.reverse(previous_numbers)
  end

  defp extract_full_part_number([head | tail], previous_numbers) do
    case Regex.match?(~r/^\d+$/, head) do
      true -> extract_full_part_number(tail, [head | previous_numbers])
      false -> :lists.reverse(previous_numbers)
    end
  end

  # Use tail-recursion to identify any character different from @period and not a digit
  def extract_symbols({puzzle_line, line_index}) do
    line_characters = String.graphemes(puzzle_line) |> List.delete(@end_of_line)
    extract_symbols(line_characters, line_index, 0, [])
  end

  defp extract_symbols([], _line_index, _position, previous_symbols) do
    :lists.reverse(previous_symbols)
  end

  defp extract_symbols([head | tail], line_index, position, previous_symbols) do
    cond do
      head != @period and not Regex.match?(~r/^\d+$/, head) ->
        another_symbol = %Symbol{character: head, x: position, y: line_index}
        extract_symbols(tail, line_index, position + 1, [another_symbol | previous_symbols])

      true -> extract_symbols(tail, line_index, position + 1, previous_symbols)
    end
  end

end
