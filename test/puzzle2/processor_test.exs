defmodule AdventOfCode2023.Puzzle2.ProcessorTest do
  use ExUnit.Case

  alias AdventOfCode2023.Puzzle2.Processor

  doctest Processor

  @possible_game_with_missing_cubes %{
    "id" => "1",
    "cubes_sets" => [
      %{"blue" => "3", "red" => "4"},
      %{"green" => "2", "blue" => "6"},
      %{"green" => "2"}
    ]
  }

  @possible_game_with_all_cubes %{
    "id" => "2",
    "cubes_sets" => [
      %{"blue" => "3", "red" => "4", "green" => "5"},
      %{"red" => "1", "green" => "2", "blue" => "6"},
      %{"green" => "2", "blue" => "6", "red" => "2"}
    ]
  }

  @possible_games [
    @possible_game_with_missing_cubes,
    @possible_game_with_all_cubes,
    %{"id" => "3",
      "cubes_sets" => [
        %{"blue" => "3", "red" => "4"},
        %{"green" => "2", "blue" => "6"},
        %{"green" => "2"}
      ]
    }]

  @impossible_games [
    %{"id" => "4",
      "cubes_sets" => [
        %{"blue" => "3", "red" => "4"},
        %{"green" => "2", "blue" => "15"}, # too much blue
        %{"green" => "2"}
      ]
    },
    %{"id" => "5",
      "cubes_sets" => [
        %{"blue" => "3", "red" => "13"}, # too much red
        %{"green" => "2", "blue" => "6"},
        %{"green" => "2"}
      ]
    },
    %{"id" => "6",
      "cubes_sets" => [
        %{"blue" => "3", "red" => "4"},
        %{"green" => "2", "blue" => "6"},
        %{"green" => "14"} # too much green
      ]
    },
  ]

  test "Puzzle2.Processor.find_possible_games returns the game when 'possible' (with all cubes)" do
    assert [@possible_game_with_all_cubes] = Processor.find_possible_games([@possible_game_with_all_cubes])
  end

  test "Puzzle2.Processor.find_possible_games returns game ID of one 'possible' game (some missing cubes)" do
    assert [@possible_game_with_missing_cubes] = Processor.find_possible_games([@possible_game_with_missing_cubes])
  end

  test "Puzzle2.Processor.find_possible_games filters out all 'impossible' games" do
    assert [] = Processor.find_possible_games(@impossible_games)
  end

  test "Puzzle2.Processor.find_possible_games filters correctly between 'possible' and 'impossible' games" do
    games = [@possible_game_with_missing_cubes] ++ @impossible_games ++ [@possible_game_with_all_cubes]

    assert [@possible_game_with_missing_cubes, @possible_game_with_all_cubes] = Processor.find_possible_games(games)
  end

  test "Puzzle2.Processor.sum_game_ids returns the correct total" do
    assert 6 = Processor.sum_game_ids(@possible_games)
  end

end
