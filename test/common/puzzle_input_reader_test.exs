defmodule PuzzleInputReaderTest do
  use ExUnit.Case

  alias PuzzleInputReader

  @moduletag :capture_log

  doctest PuzzleInputReader

  test "module exists" do
    assert is_list(PuzzleInputReader.module_info())
  end

  test "PuzzleInputReader can read file content as list of strings" do
    assert PuzzleInputReader.read_as_strings("test/puzzle_input_reader_test_file.txt") == ["line1", "line2,word2"]
  end

  test "PuzzleInputReader can stream file content as list of strings" do
    assert PuzzleInputReader.stream_as_strings("test/puzzle_input_reader_test_file.txt") == ["line1", "line2,word2"]
  end
end
