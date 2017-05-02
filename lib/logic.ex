defmodule Logic do
  def move(player, board) do
    if player.my_turn == true do
      "OKAY"
    else
      board
    end
  end
end
