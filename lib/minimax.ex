# def minimax(game_state):
#   return max(
#     map(lambda move: (move, min_play(game_state.next_state(move))),
#       game_state.get_available_moves()),
#     key = lambda x: x[1])
#
# def min_play(game_state):
#   if game_state.is_gameover():
#     return evaluate(game_state)
#   return min(
#     map(lambda move: max_play(game_state.next_state(move)),
#       game_state.get_available_moves()))
#
# def max_play(game_state):
#   if game_state.is_gameover():
#     return evaluate(game_state)
#   return max(
#     map(lambda move: min_play(game_state.next_state(move)),
#       game_state.get_available_moves()))



defmodule Minimax do

  # o = %GameState{board: ["O","O","X","X","O","X","O","X",8], player: "O"}
  # x = %GameState{board: ["O","O","X","X","O","X","O","X",8], player: "X"}

  # human
  @player "X"

  # ai
  @opponent "O"

  # def is_moves_left?(board) do
  #   Enum.any?(board, fn(x) -> is_integer(x) end)
  # end
  #
  # def won?([x0,x1,x2,x3,x4,x5,x6,x7,x8]) do
  #   (x0 == x1) and (x1 == x2) or
  #   (x3 == x4) and (x4 == x5) or
  #   (x6 == x7) and (x7 == x8) or
  #   (x0 == x3) and (x3 == x6) or
  #   (x1 == x4) and (x4 == x7) or
  #   (x2 == x5) and (x5 == x8) or
  #   (x0 == x4) and (x4 == x8) or
  #   (x2 == x4) and (x4 == x6)
  # end

  def evaluate(game_state) do
    cond do
      won?(game_state) and game_state.player == @player -> 10
      won?(game_state) and game_state.player == @opponent -> -10
      true -> 0
    end
  end

  # def toggle_turn(is_max?) do
  #   !is_max?
  # end

  def get_available_moves(game_state) do
    Enum.filter(game_state.board, fn(x) -> is_integer(x) end)
  end

  def next_state(game_state, move) do
    %GameState{board: List.replace_at(game_state.board, move, game_state.player), player: toggle_player(game_state.player)}
  end

  def is_gameover(game_state) do
    cond do
      won?(game_state) -> true
      !won?(game_state) and all_taken?(game_state) -> true
      true -> false
    end
  end

  def won?(game_state) do
    [x0,x1,x2,x3,x4,x5,x6,x7,x8] = game_state.board
    (x0 == x1) and (x1 == x2) or
    (x3 == x4) and (x4 == x5) or
    (x6 == x7) and (x7 == x8) or
    (x0 == x3) and (x3 == x6) or
    (x1 == x4) and (x4 == x7) or
    (x2 == x5) and (x5 == x8) or
    (x0 == x4) and (x4 == x8) or
    (x2 == x4) and (x4 == x6)
  end

  def all_taken?(game_state) do
    Enum.all?(game_state.board, fn(x) -> is_bitstring(x) end)
  end

  # def min_play(game_state) do
  #   if is_gameover(game_state) do
  #     -10
  #   else
  #     Enum.min(Enum.map(get_available_moves(game_state), fn(x) -> max_play(next_state(game_state, x)) end))
  #   end
  # end


  def min_play(game_state) do
    if is_gameover(game_state) do
      evaluate(game_state)
    else
      Enum.min(Enum.map(get_available_moves(game_state), fn(x) -> max_play(next_state(game_state, x)) end))
      # Enum.map(get_available_moves(game_state), fn(x) -> max_play(next_state(game_state, x)) end)
    end
  end


  def max_play(game_state) do
    if is_gameover(game_state) do
      evaluate(game_state)
    else
      Enum.max(Enum.map(get_available_moves(game_state), fn(x) -> min_play(next_state(game_state, x)) end))
      # Enum.map(get_available_moves(game_state), fn(x) -> min_play(next_state(game_state, x)) end)
    end
  end

  # def minimax(game_state) do
  #   Enum.max(Enum.map(get_available_moves(game_state), fn(x) -> min_play(next_state(game_state, x)) end))
  # end

  def toggle_player(p) do
    if p == @player do
      @opponent
    else
      @player
    end
  end
  #
  # def ident2(x) do
  #   cond do
  #     is_bitstring(x) ->
  #       x
  #     x == 0 ->
  #       0
  #     true ->
  #       ident2(x - 1)
  #   end
  # end
  #
  # def map_it() do
  #   Enum.map(["X","O","X","O","O","X",6,"X",12], &ident2/1)
  # end

  # def minimax(board, is_max?) do
  #   score = evaluate(board, is_max?)
  #   cond do
  #     score == 10 -> score
  #     score == -10 -> score
  #     score == 0 -> 0
  #     # is_nil(score) -> minimax((List.replace_at(board, candidate, "R"), !is_max?))
  #   end
  # end
end
