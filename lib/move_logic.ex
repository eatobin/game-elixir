# defmodule MoveLogic do
#   def obtain_hal_move(board, h_symbol) do
#     cond do
#       # if open, first move is Hal's favorite
#       (Enum.at(board, 4) == 4) -> 4
#
#       # subsequent move is Hal's
#       (Enum.any?(board, fn(x) -> is_bitstring(x) end)) ->
#         candidates = possible_hal_moves(board)
#         get_best_hal_move(candidates, board, h_symbol)
#     end
#   end
#
#   def possible_hal_moves(board) do
#     Enum.filter(board, fn(x) -> is_integer(x) end)
#   end
#
#   def get_best_hal_move([candidate|[]], _board, _h_symbol) do
#     candidate
#   end
#
#   def get_best_hal_move([candidate|rest], board, h_symbol) do
#     cond do
#       Rules.game_won?(List.replace_at(board, candidate, "H")) -> candidate
#       Rules.game_won?(List.replace_at(board, candidate, h_symbol)) -> candidate
#       true -> get_best_hal_move(rest, board, h_symbol)
#     end
#   end
#
#   def toggle_turn(human_turn?) do
#     !human_turn?
#   end
# end
