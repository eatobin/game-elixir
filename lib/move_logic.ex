defmodule MoveLogic do
  def move(player, board, human_move) do
    cond do
      # first move is Hal's
      (player.p_symbol == "H") and
      (Enum.all?(board, fn(x) -> is_integer(x) end)) ->
        (List.replace_at(board, 0, "H"))

      # subsequent move is Hal's
      (player.p_symbol == "H") and
      (Enum.any?(board, fn(x) -> is_bitstring(x) end)) ->
        candidates = possible_moves(board)
        get_best_move(candidates, board)

      # a human move
      (player.p_symbol != "H") ->
        (List.replace_at(board, human_move, player.p_symbol))

      true -> board
    end
  end

  def possible_moves(board) do
    Enum.filter(board, fn(x) -> is_integer(x) end)
  end

  def get_best_move([candidate|[]], _board) do
    candidate
  end

  def get_best_move([candidate|rest], board) do
    cond do
      Rules.game_won?(List.replace_at(board, candidate, "H")) -> candidate
      true -> get_best_move(rest, board)
    end
  end
end
