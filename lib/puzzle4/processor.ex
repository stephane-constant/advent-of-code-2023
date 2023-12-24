defmodule AdventOfCode2023.Puzzle4.Processor do

  alias AdventOfCode2023.Puzzle4.Card
  alias AdventOfCode2023.Puzzle4Part2.CardCounter

  @doc """
  Returns 0 when no winning number has a match.
  Returns 1 when a single winning number has a match.
  Doubles the points for each winning number with a match.
  """
  def compute_card_points(%Card{winning_numbers: winning_numbers, numbers: numbers}) do
    matching_count = _count_matching_numbers(winning_numbers, numbers, 0)

    if matching_count == 0 do
      0
    else
      2 ** (matching_count - 1)
    end
  end

  defp _count_matching_numbers([], _, count), do: count

  defp _count_matching_numbers([head | tail], numbers, count) do
    cond do
      Enum.member?(numbers, head) -> _count_matching_numbers(tail, numbers, count + 1)
      true -> _count_matching_numbers(tail, numbers, count)
    end
  end

  @doc """
  Counts 1 per card at start.
  For each card with N matching numbers, the N following cards are 'counted' N times more.
  Returns the total count of cards when no more cards.
  """
  def copy_cards_with_matching_numbers(cards) do
    cards_counters = cards |> Enum.map(fn card -> %CardCounter{card: card, count: 1} end)
#    IO.inspect(cards_counters, label: "cards_counters")

    _check_matching_numbers(cards_counters)
  end

  defp _check_matching_numbers([head]) do
#    %CardCounter{card: %Card{id: card_id} = card, count: card_count} = head
#    IO.inspect(head, label: "last card #{card_id} : no more matching check")

    [head]
  end

  defp _check_matching_numbers([head | tail]) do
    %CardCounter{card: card, count: card_count} = head
    %Card{winning_numbers: winning_numbers, numbers: numbers} = card

    matching_numbers_count = _count_matching_numbers(winning_numbers, numbers, 0)

    if matching_numbers_count > 0 do
      updated_next_counters = _increment_next_counters(tail, card_count, matching_numbers_count)
      [head | _check_matching_numbers(updated_next_counters)]
    else
      [head | _check_matching_numbers(tail)]
    end
  end

  defp _increment_next_counters([head | tail], _, remaining_cards_to_increment) when remaining_cards_to_increment == 0 do
    [head | tail]
  end

  defp _increment_next_counters([head], increment, _) do
    [CardCounter.increment(head, increment)]
  end

  defp _increment_next_counters([head | tail], increment, remaining_cards_to_increment) when remaining_cards_to_increment > 0 do
    updated_counter = CardCounter.increment(head, increment)
    [updated_counter | _increment_next_counters(tail, increment, remaining_cards_to_increment - 1)]
  end
  
end
