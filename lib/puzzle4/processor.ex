defmodule AdventOfCode2023.Puzzle4.Processor do

  alias AdventOfCode2023.Puzzle4.Card

  def compute_card_points(%Card{winning_numbers: winning_numbers, numbers: numbers}) do
    _compute_winning_numbers_points(winning_numbers, numbers, 0)
  end

  defp _compute_winning_numbers_points([], _, reward), do: reward

  defp _compute_winning_numbers_points([head | tail], numbers, reward) do
    cond do
      Enum.member?(numbers, head) and reward == 0 -> _compute_winning_numbers_points(tail, numbers, 1)
      Enum.member?(numbers, head) -> _compute_winning_numbers_points(tail, numbers, reward * 2)
      true -> _compute_winning_numbers_points(tail, numbers, reward)
    end
  end
  
end
