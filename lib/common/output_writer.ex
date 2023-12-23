defmodule AdventOfCode2023.Common.OutputWriter do
  @moduledoc false

  def write(items, filename) do

    case File.open(Path.join("output", filename), [:write]) do
      {:ok, file} ->
        File.write(file, items)
        File.close(file)

      {:error, reason} ->
        IO.puts("File not writable because of #{reason}")
    end
  end

  def write_structs(items, filename) do

    case File.open(Path.join("output", filename), [:write]) do
      {:ok, file} ->
        for item <- items, do: IO.write(file, inspect(item) <> "\n")
        File.close(file)

      {:error, reason} ->
        IO.puts("File not writable because of #{reason}")
    end
  end
end
