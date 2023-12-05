defmodule PuzzleInputReaderTest do
  use ExUnit.Case

  alias PuzzleInputReader

  @moduletag :capture_log

  doctest PuzzleInputReader

  test "PuzzleInputReader can read file content as list of strings" do
    assert PuzzleInputReader.read_as_strings("test/resources/puzzle_input_reader_test_input.txt") == ["line1", "line2,word2"]
  end

  test "PuzzleInputReader can stream file content as list of strings" do
    assert PuzzleInputReader.stream_as_strings("test/resources/puzzle_input_reader_test_input.txt") == ["line1", "line2,word2"]
  end
end
