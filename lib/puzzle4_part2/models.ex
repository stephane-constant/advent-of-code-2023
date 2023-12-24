defmodule AdventOfCode2023.Puzzle4Part2.CardCounter do
  defstruct card: nil, count: 0

  def increment(%{count: count} = card_counter, inc) do
    %{card_counter | count: count + inc}
  end
end