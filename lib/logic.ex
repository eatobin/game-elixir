defmodule Logic do
  def move(player, board) do
    if (player.my_turn == true) and
      (player.p_symbol == "H") and
      (Enum.all?(board, fn(x) -> is_integer(x) end))
    do
      (List.replace_at(board, 0, player.p_symbol))
    else
      board
    end
  end
end
