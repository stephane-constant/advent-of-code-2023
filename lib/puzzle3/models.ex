defmodule AdventOfCode2023.Puzzle3.PartNumber do
  @doc "A part number with its value and coordinates in the engine schematic."
  defstruct [:value, :x, :y]
end

defmodule AdventOfCode2023.Puzzle3.Symbol do
  @doc "A symbol with its coordinates in the engine schematic."
  defstruct [:character, :x, :y]
end