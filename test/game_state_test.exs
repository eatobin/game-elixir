ExUnit.start()

defmodule GameStateTest do
  use ExUnit.Case, async: true

  @ai_wins_in_one %GameState{
    board: ["A", "a", "b", "c", "A", "d", "e", "f", 8],
    player: "A",
    ai_symbol: "A",
    depth: 0,
    human_symbol: "H"
  }
  @won %GameState{
    board: ["A", "a", "b", "c", "A", "d", "e", "f", "A"],
    player: "A",
    ai_symbol: "A",
    depth: 0,
    human_symbol: "H"
  }
  @tied %GameState{
    board: ["A", "a", "b", "c", "A", "d", "e", "f", "g"],
    player: "A",
    ai_symbol: "A",
    depth: 0,
    human_symbol: "H"
  }

  test "get_available_moves" do
    # Elixir for [8]!
    assert GameState.get_available_moves(@ai_wins_in_one) == ~c"\b"
  end

  test "all_taken?" do
    assert GameState.all_taken?(@won) == true
  end

  test "next_state" do
    assert GameState.next_state(@ai_wins_in_one, 8) == %GameState{
             ai_symbol: "A",
             board: ["A", "a", "b", "c", "A", "d", "e", "f", "A"],
             depth: 1,
             human_symbol: "H",
             player: "H"
           }
  end

  test "won?" do
    assert GameState.won?(@ai_wins_in_one) == false
    assert GameState.won?(@won) == true
    assert GameState.won?(@tied) == false
  end

  test "is_gameover?" do
    assert GameState.is_gameover?(@ai_wins_in_one) == false
    assert GameState.is_gameover?(@won) == true
    assert GameState.is_gameover?(@tied) == true
  end

  test "evaluate" do
    assert GameState.evaluate(@won) == -10
    assert GameState.evaluate(@tied) == 0
  end

  test "toggle_player" do
    assert GameState.toggle_player(@ai_wins_in_one) == "H"
  end
end
