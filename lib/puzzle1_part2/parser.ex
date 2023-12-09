defmodule AdventOfCode2023.Puzzle1Part2.Parser do
  require Logger

  @moduledoc false

  @doc """
  Parses line of puzzle 1 part 2 in Elixir way : apply recursion + pattern matching + function guards.
  Function clauses are grouped and ordered by arity then number on purpose.
  Note that when we find one of the words "number", we put back some of the characters,
  as they may start the following one (ex : twone is 2 then 1. nineightwo is 9 then 8 then 2).
  The final step is to reverse (because inserted as head, to go fast) and return the list of digits only.
  """
  def parse(puzzle_line) do
    digits_only = _digits_only(puzzle_line, [])
    first_digit = List.first(digits_only, 0)
    last_digit = List.last(digits_only, 0)
    Logger.debug("Puzzle 1 part 2 : parse line #{puzzle_line} => #{inspect(digits_only)} => #{first_digit}#{last_digit}")
    Integer.undigits([first_digit, last_digit])
  end

  @numeric_values Enum.map(0..9, &Integer.to_string/1)

  defp _digits_only(<<head::binary-size(5)>> <> tail, digits_only) when head == "three" do
    _digits_only("hree" <> tail, [3 | digits_only])
  end

  defp _digits_only(<<head::binary-size(5)>> <> tail, digits_only) when head == "seven" do
    _digits_only("even" <> tail, [7 | digits_only])
  end

  defp _digits_only(<<head::binary-size(5)>> <> tail, digits_only) when head == "eight" do
    _digits_only("ight" <> tail, [8 | digits_only])
  end

  defp _digits_only(<<head::binary-size(4)>> <> tail, digits_only) when head == "zero" do
    _digits_only("o" <> tail, [0 | digits_only])
  end

  defp _digits_only(<<head::binary-size(4)>> <> tail, digits_only) when head == "four" do
    _digits_only(tail, [4 | digits_only])
  end

  defp _digits_only(<<head::binary-size(4)>> <> tail, digits_only) when head == "five" do
    _digits_only("e" <> tail, [5 | digits_only])
  end

  defp _digits_only(<<head::binary-size(4)>> <> tail, digits_only) when head == "nine" do
    _digits_only("ine" <> tail, [9 | digits_only])
  end

  defp _digits_only(<<head::binary-size(3)>> <> tail, digits_only) when head == "one" do
    _digits_only("e" <> tail, [1 | digits_only])
  end

  defp _digits_only(<<head::binary-size(3)>> <> tail, digits_only) when head == "two" do
    _digits_only("o" <> tail, [2 | digits_only])
  end

  defp _digits_only(<<head::binary-size(3)>> <> tail, digits_only) when head == "six" do
    _digits_only(tail, [6 | digits_only])
  end

  defp _digits_only(<<head::binary-size(1)>> <> tail, digits_only) when head in @numeric_values do
    _digits_only(tail, [String.to_integer(head) | digits_only])
  end

  defp _digits_only(<<_::binary-size(1)>> <> tail, digits_only) do
    _digits_only(tail, digits_only)
  end

  defp _digits_only("", digits_only) do
    :lists.reverse(digits_only)
  end


  @doc """
  Parse line of puzzle 1 part 2 : recursive loop upon puzzle line to extract numbers
  (found as "word" or numeric value), then continue 1 character after.
  Once the whole line has been processed, keep only first and last digits, and return as new integer.
  This recursive loop works well but is not much Elixir-ish :-)
  """
  def parse_without_pattern_matching(puzzle_line) do
    all_digits = _extract_digits(puzzle_line, [])
    first_digit = List.last(all_digits, 0)
    last_digit = List.first(all_digits, 0)
    Logger.debug("Puzzle 1 part 2 : parse line #{puzzle_line} => #{inspect(:lists.reverse(all_digits))} => #{first_digit}#{last_digit}")
    Integer.undigits([first_digit, last_digit])
  end

  defp _extract_digits(puzzle_line, previous_digits) do
    cond do
      String.length(puzzle_line) == 0 ->
        # stop recursive iterations now, return digits (in inverse order).
        previous_digits

      true ->
        # extract number. Attention : the new value is inserted as list head, to fasten the operation.
        new_previous_digits =
          cond do
            String.starts_with?(puzzle_line, "zero") or String.starts_with?(puzzle_line, "0") -> [0 | previous_digits]
            String.starts_with?(puzzle_line, "one") or String.starts_with?(puzzle_line, "1") -> [1 | previous_digits]
            String.starts_with?(puzzle_line, "two") or String.starts_with?(puzzle_line, "2") -> [2 | previous_digits]
            String.starts_with?(puzzle_line, "three") or String.starts_with?(puzzle_line, "3") -> [3 | previous_digits]
            String.starts_with?(puzzle_line, "four") or String.starts_with?(puzzle_line, "4") -> [4 | previous_digits]
            String.starts_with?(puzzle_line, "five") or String.starts_with?(puzzle_line, "5") -> [5 | previous_digits]
            String.starts_with?(puzzle_line, "six") or String.starts_with?(puzzle_line, "6") -> [6 | previous_digits]
            String.starts_with?(puzzle_line, "seven") or String.starts_with?(puzzle_line, "7") -> [7 | previous_digits]
            String.starts_with?(puzzle_line, "eight") or String.starts_with?(puzzle_line, "8") -> [8 | previous_digits]
            String.starts_with?(puzzle_line, "nine") or String.starts_with?(puzzle_line, "9") -> [9 | previous_digits]
            true -> previous_digits
          end

        # go for another recursive iteration.
        _extract_digits(String.slice(puzzle_line, 1..-1), new_previous_digits)
    end
  end

end