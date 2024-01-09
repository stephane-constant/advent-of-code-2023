defmodule AdventOfCode2023.Puzzle4.ProcessorTest do
  use ExUnit.Case, async: true

  alias AdventOfCode2023.Puzzle4.Card
  alias AdventOfCode2023.Puzzle4.Processor
  alias AdventOfCode2023.Puzzle4Part2.CardCounter

  test "Puzzle4.Processor.compute_card_points returns 0 when no winning number" do
    card = %Card{id: 1, winning_numbers: [1, 2, 3], numbers: [4, 5, 6]}

    assert 0 == Processor.compute_card_points(card)
  end

  test "Puzzle4.Processor.compute_card_points returns 1 when 1 winning number" do
    card = %Card{id: 1, winning_numbers: [1, 2, 3], numbers: [4, 3, 6]}

    assert 1 == Processor.compute_card_points(card) # "3" -> 1 point as card points
  end

  test "Puzzle4.Processor.compute_card_points doubles points at each winning number and sum them all" do
    card = %Card{id: 1, winning_numbers: [41, 48, 83, 86, 17], numbers: [83, 86, 6, 31, 17, 9, 48, 53]}

    # "48" -> 1 point, "83" -> 2 points, "86" -> 4 points, "17" -> 8 points as card points
    assert 8 == Processor.compute_card_points(card)
  end

  test "Puzzle4.Processor.copy_cards_with_matching_numbers copies cards with matching numbers as much as needed" do
    cards = [
      %Card{id: 1, winning_numbers: [1, 2, 3, 4, 5], numbers: [7, 8, 5, 3]}, # 2 matching numbers -> +1 for cards '2' and '3'
      %Card{id: 2, winning_numbers: [11, 12, 13], numbers: [13, 14, 15, 16]}, # 1 matching number -> +2 for card '3' (because there are 2 cards '2'
      %Card{id: 3, winning_numbers: [21, 22, 23, 24], numbers: [31, 32, 33]}, #0 matching number
    ]

    updated_counters = [
      %CardCounter{card: %Card{id: 1, winning_numbers: [1, 2, 3, 4, 5], numbers: [7, 8, 5, 3]}, count: 1},
      %CardCounter{card: %Card{id: 2, winning_numbers: [11, 12, 13], numbers: [13, 14, 15, 16]}, count: 2},
      %CardCounter{card: %Card{id: 3, winning_numbers: [21, 22, 23, 24], numbers: [31, 32, 33]}, count: 4},
    ]

    assert updated_counters == Processor.copy_cards_with_matching_numbers(cards)
  end

end
