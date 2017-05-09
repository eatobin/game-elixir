ExUnit.start

defmodule RulesTest do
  use ExUnit.Case, async: true

  @winning_row_hal ["H", 1, 2, 3, "H", 5, 6, 7, "H"]
  @winning_row_human [0, 1, "E", 3, "E", 5, "E", 7, 8]
  @not_winning_row [0, 1, "E", 3, "H", 5, "E", 7, 8]
  @tie_game ["T", "T", "T", "T", "T", "T", "T", "T", "T"]

  test "check for game won (winning row)" do
    assert Rules.game_won?(@winning_row_hal) == true
    assert Rules.game_won?(@winning_row_human) == true
    assert Rules.game_won?(@not_winning_row) == false
  end

  test "check for tie board" do
    assert Rules.tie?(@tie_game) == true
    assert Rules.tie?(@winning_row_human) == false
    assert Rules.tie?(@not_winning_row) == false
  end
end
