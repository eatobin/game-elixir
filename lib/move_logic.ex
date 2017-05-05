defmodule MoveLogic do
  def obtain_hal_move(board) do
    cond do
      # first move is Hal's
      (Enum.all?(board, fn(x) -> is_integer(x) end)) -> 0

      # subsequent move is Hal's
      (Enum.any?(board, fn(x) -> is_bitstring(x) end)) ->
        candidates = possible_hal_moves(board)
        get_best_hal_move(candidates, board)
    end
  end

  def possible_hal_moves(board) do
    Enum.filter(board, fn(x) -> is_integer(x) end)
  end

  def get_best_hal_move([candidate|[]], _board) do
    candidate
  end

  def get_best_hal_move([candidate|rest], board) do
    cond do
      Rules.game_won?(List.replace_at(board, candidate, "H")) -> candidate
      true -> get_best_hal_move(rest, board)
    end
  end

  def toggle_turn(human_turn?) do
    !human_turn?
  end
end
