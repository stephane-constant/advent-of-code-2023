defmodule AdventOfCode2023.Puzzle2.ProcessorTest do
  use ExUnit.Case

  alias AdventOfCode2023.Puzzle2.Processor

  doctest Processor

  test "Puzzle2.Processor returns game ID of one 'possible' game (with all cubes)" do
    games = [
      %{"id" => "1",
        "cubes_sets" => [
          %{"blue" => "3", "red" => "4", "green" => "5"},
          %{"red" => "1", "green" => "2", "blue" => "6"},
          %{"green" => "2", "blue" => "6", "red" => "2"}
        ]
      }
    ]

    assert 1 = Processor.sum_possible_game_ids(games)
  end

  test "Puzzle2.Processor returns game ID of one 'possible' game (some missing cubes)" do
    games = [
      %{"id" => "1",
        "cubes_sets" => [
          %{"blue" => "3", "red" => "4"},
          %{"green" => "2", "blue" => "6"},
          %{"green" => "2"}
        ]
      }
    ]

    assert 1 = Processor.sum_possible_game_ids(games)
  end

  test "Puzzle2.Processor filters out 'impossible' games" do
    games = [
      %{"id" => "1",
        "cubes_sets" => [
          %{"blue" => "3", "red" => "4"},
          %{"green" => "2", "blue" => "15"}, # too much blue
          %{"green" => "2"}
        ]
      },
      %{"id" => "2",
        "cubes_sets" => [
          %{"blue" => "3", "red" => "13"}, # too much red
          %{"green" => "2", "blue" => "6"},
          %{"green" => "2"}
        ]
      },
      %{"id" => "3",
        "cubes_sets" => [
          %{"blue" => "3", "red" => "4"},
          %{"green" => "2", "blue" => "6"},
          %{"green" => "14"} # too much green
        ]
      },
    ]

    assert 0 = Processor.sum_possible_game_ids(games)
  end

  test "Puzzle2.Processor sums game ID of several 'possible' games, and filters out the 'impossible' one" do
    games = [
      %{"id" => "1",
        "cubes_sets" => [
          %{"blue" => "3", "red" => "4"},
          %{"green" => "2", "blue" => "6"},
          %{"green" => "2"}
        ]
      },
      %{"id" => "2",
        "cubes_sets" => [
          %{"blue" => "3", "red" => "13"}, # too much red
          %{"green" => "2", "blue" => "6"},
          %{"green" => "2"}
        ]
      },
      %{"id" => "3",
        "cubes_sets" => [
          %{"blue" => "3", "red" => "4"},
          %{"green" => "2", "blue" => "6"},
          %{"green" => "2"}
        ]
      },
    ]

    assert 4 = Processor.sum_possible_game_ids(games)
  end

end
