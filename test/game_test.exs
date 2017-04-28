ExUnit.start

defmodule GameTest do
  use ExUnit.Case, async: true

  # @winning_row_X ["X", 1, 2, 3, "X", 5, 6, 7, "X"]
  # @winning_row_O [0, "O", 2, 3, "O", 5, 6, "O", 8]
  # @not_winning_row ["O", 1, 2, 3, "O", 5, 6, "O", 8]
  # @kinda_tie_game ["O", "X", "O", "X", "O", "X", "O", "X", "O"]
  @winning_row_X_next ["X", 1, 2, 3, 4, 5, 6, 7, "X"]
  @winning_row_O_next [0, "O", 2, 3, "O", 5, 6, 7, 8]
  @no_winning_row_next ["X", 1, 2, 3, 4, 5, 6, 7, 8]

  # test "check for game over (winning row)" do
  #   assert Game.game_over?(@winning_row_X) == true
  #   assert Game.game_over?(@winning_row_O) == true
  #   assert Game.game_over?(@not_winning_row) == false
  # end
  #
  # test "check for tie board" do
  #   assert Game.tie?(@kinda_tie_game) == true
  #   assert Game.tie?(@not_winning_row) == false
  # end

  test "get best move" do
    assert Game.get_best_move([3,4,5], @winning_row_X_next) == 4
    assert Game.get_best_move([5,6,7], @winning_row_O_next) == 7
    assert Game.get_best_move([1, 2, 3, 4, 5, 6, 7, 8], @no_winning_row_next) == 8
  end
end
