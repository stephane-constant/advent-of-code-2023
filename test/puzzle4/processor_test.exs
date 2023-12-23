defmodule AdventOfCode2023.Puzzle4.ProcessorTest do
  use ExUnit.Case

  alias AdventOfCode2023.Puzzle4.Processor
  alias AdventOfCode2023.Puzzle4.Card

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

end
