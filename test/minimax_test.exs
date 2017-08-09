ExUnit.start

defmodule MinimaxTest do
  use ExUnit.Case, async: true

  @ai_wins_in_one %GameState{board: ["A","a","b","c","A","d","e","f",8], player: "A", ai_symbol: "A", depth: 0, human_symbol: "H"}
  @ai_starts_the_game %GameState{board: [0,1,2,3,4,5,6,7,8], player: "A", ai_symbol: "A", depth: 0, human_symbol: "H"}
  # From https://pwdd.github.io/post/minimax-in-clojure:
  @from_closure_example %GameState{board: ["A","H",2,3,"A",5,6,"H",8], player: "A", ai_symbol: "A", depth: 0, human_symbol: "H"}

  test "game won by ai @ 8 with depth (10 - 1)" do
    assert Minimax.minimax(@ai_wins_in_one) == {8,9}
  end

  test "game tie by ai @ 0 with depth (10 - 10)" do
    assert Minimax.minimax(@ai_starts_the_game) == {0,0}
  end

  test "game win by ai @ 8 with depth (10 - 1). It could also win later!" do
    assert Minimax.minimax(@from_closure_example) == {8,9}
  end
end
