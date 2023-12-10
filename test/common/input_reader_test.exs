defmodule AdventOfCode2023.Common.InputReaderTest do
  use ExUnit.Case, async: true

  alias AdventOfCode2023.Common.InputReader

  @moduletag :capture_log

  doctest InputReader

  test "PuzzleInputReader can read file content as list of strings" do
    assert InputReader.read_as_strings("test/common/input_reader_test_input.txt") == ["line1", "line2,word2"]
  end

  test "PuzzleInputReader can stream file content as list of strings" do
    assert InputReader.stream_as_strings("test/common/input_reader_test_input.txt") == ["line1", "line2,word2"]
  end

  test "PuzzleInputReader can stream file content as list of strings with index" do
    assert InputReader.stream_as_strings("test/common/input_reader_test_input.txt") == [{"line1", 0}, {"line2,word2", 1}]
  end
end
