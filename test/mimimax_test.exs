ExUnit.start

defmodule MinimaxTest do
  use ExUnit.Case, async: true
  setup do
    Code.require_file("lib/game_state.ex")
  end

  @x %GameState{board: ["X","a","b","c","X","d","e","f",8], player: "X"}
  @sample %GameState{board: ["O",1,"X","X",4,5,"X","O","O"], player: "X"}
  @sample3 %GameState{board: ["O",1,"X","X",4,"X",6,"O","O"], player: "X"}
  @sample5 %GameState{board: ["X","O",2,3,"X",5,6,"O",8], player: "X"}
  @start %GameState{board: [0,1,2,3,4,5,6,7,8], player: "X"}

  test "check for best AI move" do
    assert Minimax.minimax(@x) == {8, 9}
    assert Minimax.minimax(@sample) == {4, 9}
    assert Minimax.minimax(@sample3) == {4, 9}
    assert Minimax.minimax(@sample5) == {8, 9}
    assert Minimax.minimax(@start) == {0, 0}
  end
end
