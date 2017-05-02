defmodule Logic do
  def move(player, board) do
    if (player.my_turn == true) and
       (Enum.all?(board, fn(x) -> is_integer(x) end))
    do
      "OKAY"
    else
      board
    end
  end
end
