ExUnit.start

defmodule MinimaxTest do
  use ExUnit.Case, async: true

  @x %GameState{board: ["max","a","b","c","max","d","e","f",8], player: "max"}
  @sample %GameState{board: ["min",1,"max","max",4,5,"max","min","min"], player: "max"}
  @sample3 %GameState{board: ["min",1,"max","max",4,"max",6,"min","min"], player: "max"}
  @sample5 %GameState{board: ["max","min",2,3,"max",5,6,"min",8], player: "max"}
  @start %GameState{board: [0,1,2,3,4,5,6,7,8], player: "max"}

  test "check for best AI move" do
    assert Minimax.minimax(@x) == {8, 9}
    assert Minimax.minimax(@sample) == {4, 9}
    assert Minimax.minimax(@sample3) == {4, 9}
    assert Minimax.minimax(@sample5) == {8, 9}
    assert Minimax.minimax(@start) == {0, 0}
  end
end
