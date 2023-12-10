defmodule AdventOfCode2023.Puzzle2.Game do
  @doc "A game. The cubes_sets are a list of sets of cubes."
  @enforce_keys [:id]
  defstruct id: nil, cubes_sets: []
end

defmodule AdventOfCode2023.Puzzle2.CubesSet do
  @doc "A set of cubes, ie the number of cubes associated with each of the 3 cube colors."
  defstruct red: 0, green: 0, blue: 0
end
