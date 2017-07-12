ExUnit.start

defmodule MinimaxTest do
  use ExUnit.Case, async: true

  @x %GameState{board: ["X","a","b","c","X","d","e","f",8], player: "X", ai_sym: "X", depth: 0, h_sym: "O"}
  @sample %GameState{board: ["O",1,"X","X",4,5,"X","O","O"], player: "X", ai_sym: "X", depth: 0, h_sym: "O"}
  @sample3 %GameState{board: ["O",1,"X","X",4,"X",6,"O","O"], player: "X", ai_sym: "X", depth: 0, h_sym: "O"}
  @sample5 %GameState{board: ["X","O",2,3,"X",5,6,"O",8], player: "X", ai_sym: "X", depth: 0, h_sym: "O"}
  @start %GameState{board: [0,1,2,3,4,5,6,7,8], player: "X", ai_sym: "X", depth: 0, h_sym: "O"}

  test "check for best AI move" do
    assert Minimax.minimax(@x) == {8, 9}
    assert Minimax.minimax(@sample) == {4, 9}
    assert Minimax.minimax(@sample3) == {4, 9}
    assert Minimax.minimax(@sample5) == {8, 9}
    assert Minimax.minimax(@start) == {0, 0}
  end
end
