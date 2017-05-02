ExUnit.start

defmodule GameTest do
  use ExUnit.Case, async: true

  # test "get best move" do
  #   assert Game.get_best_move([3,4,5], @winning_row_X_next) == 4
  #   assert Game.get_best_move([5,6,7], @winning_row_O_next) == 7
  #   assert Game.get_best_move([1, 2, 3, 4, 5, 6, 7, 8], @no_winning_row_next) == 8
  # end
end
