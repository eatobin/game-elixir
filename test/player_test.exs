ExUnit.start

defmodule PlayerTest do
  use ExUnit.Case, async: true

  test "make_player" do
    assert Player.make_player("?", true, true) == %Player{goes_first: true, my_turn: true, p_symbol: "?"}
  end
end
