defmodule Logic do
  # def move(player, board) do
  #   if (player.my_turn == true) and
  #     (player.p_symbol == "H") and
  #     (Enum.all?(board, fn(x) -> is_integer(x) end))
  #   do
  #     (List.replace_at(board, 0, player.p_symbol))
  #   else
  #     board
  #   end
  # end
  def move(player, board, h_move) do
    cond do
      # first move is Hal's
      (player.p_symbol == "H") and
      (Enum.all?(board, fn(x) -> is_integer(x) end)) ->
        (List.replace_at(board, 0, player.p_symbol))

      # subsequent move is Hal's
      (player.p_symbol == "H") and
      (Enum.any?(board, fn(x) -> is_bitstring(x) end)) ->
        #TODO logic to get best move
        "IN PROCESS"

      # a human move
      (player.p_symbol != "H") ->
        (List.replace_at(board, h_move, player.p_symbol))

      true -> board
    end
  end

  # def substitute_square(current_val, proposed_val, board) do
  #   if is_integer(current_val)
  # end
end
