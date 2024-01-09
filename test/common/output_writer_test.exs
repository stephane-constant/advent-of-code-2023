defmodule AdventOfCode2023.Common.OutputWriterTest do
  use ExUnit.Case, async: true

  alias AdventOfCode2023.Common.OutputWriter

  @moduletag :capture_log

  doctest OutputWriter

  test "OutputWriter.write can write items in file under folder 'output'" do
    items = ["line1\n", "line2,word2\n"]
    assert items == OutputWriter.write_structs(items, "write_test.txt")
    assert File.exists?("output/write_test.txt")

    file = File.open!("output/write_test.txt")
    assert {:ok, "word2"} = :file.pread(file, 17, 5)
  end

  test "OutputWriter.write_structs can inspcet and write items in file under folder 'output'" do
    items = [%{k1: "value1", k2: "value2"}, %{k3: "value3", k4: "value4"}]
    assert items == OutputWriter.write_structs(items, "write_structs_test.txt")
    assert File.exists?("output/write_structs_test.txt")

    file = File.open!("output/write_structs_test.txt")
    assert {:ok, "value4"} = :file.pread(file, 51, 6)
  end

end
