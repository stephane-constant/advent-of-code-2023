defmodule AdventOfCode2023.Common.InputReader do
  @moduledoc false

  def read_as_strings(puzzle_filename) do
    case File.read(puzzle_filename) do
      {:ok, content} ->
        content |> String.split("\n", trim: true)

      {:error, reason} ->
        IO.puts("File not readable because of #{reason}")
    end
  end

  def stream_as_strings(puzzle_filename) do
    File.stream!(puzzle_filename, [:read])
    |> Enum.map(&String.trim/1)
  end
end
