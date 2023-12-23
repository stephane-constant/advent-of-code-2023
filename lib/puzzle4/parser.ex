defmodule AdventOfCode2023.Puzzle4.Parser do
  require Logger

  alias AdventOfCode2023.Puzzle4.Card

  def parse(puzzle_line) do
    with line_items <- String.split(puzzle_line, [":", "|"], trim: true),
         card_id <- _extract_card_id(Enum.at(line_items, 0)),
         winning_numbers <- _extract_numbers(Enum.at(line_items, 1)),
         numbers <- _extract_numbers(Enum.at(line_items, 2))
      do

      %Card{id: card_id, winning_numbers: winning_numbers, numbers: numbers}
    end
  end

  defp _extract_card_id("Card " <> card_id), do: String.trim(card_id) |> String.to_integer

  defp _extract_numbers(values) do
    String.split(values, " ", trim: true)
    |> Enum.map(&String.to_integer/1)
  end

end