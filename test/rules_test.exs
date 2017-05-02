ExUnit.start

defmodule RulesTest do
  use ExUnit.Case, async: true

  @winning_row_hal ["H", 1, "H"]
  @winning_row_human ["*", 1, "*"]
  @not_winning_row ["H", 1, "*"]
  @tie_game ["*", "*", "H"]

  test "check for game over (winning row)" do
    assert Rules.game_over?(@winning_row_hal) == true
    assert Rules.game_over?(@winning_row_human) == true
    assert Rules.game_over?(@not_winning_row) == false
  end

  test "check for tie board" do
    assert Rules.tie?(@tie_game) == true
    assert Rules.tie?(@not_winning_row) == false
  end
end
