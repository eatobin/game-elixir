ExUnit.start

defmodule RulesTest do
  use ExUnit.Case, async: true

  @winning_row_X ["X", 1, 2, 3, "X", 5, 6, 7, "X"]
  @winning_row_O [0, "O", 2, 3, "O", 5, 6, "O", 8]
  @not_winning_row ["O", 1, 2, 3, "O", 5, 6, "O", 8]
  @kinda_tie_game ["O", "X", "O", "X", "O", "X", "O", "X", "O"]

  test "check for game over (winning row)" do
    assert Rules.game_over?(@winning_row_X) == true
    assert Rules.game_over?(@winning_row_O) == true
    assert Rules.game_over?(@not_winning_row) == false
  end

  test "check for tie board" do
    assert Rules.tie?(@kinda_tie_game) == true
    assert Rules.tie?(@not_winning_row) == false
  end
end
