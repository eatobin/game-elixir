ExUnit.start

defmodule PlayerTest do
  use ExUnit.Case, async: true

  test "make_player" do
    assert Player.make_player("?", true) == %Player{my_turn: true, p_symbol: "?"}
  end
end
