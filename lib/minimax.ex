defmodule Minimax do
  # The entrance point for the recursive minimax function.
  # Maps over a list of all remaining moves.
  # Returns a tuple of {best_move_position, value of the move}.
  def minimax(game_state) do
    Enum.max_by(Enum.map(GameState.get_available_moves(game_state), fn(m) -> {m, min_play(GameState.next_state(game_state, m))} end), fn({_i, v}) -> v end)
  end

  # Returns the best move for the mininimizing player (human) once the move
  #   recursion ends.
  def min_play(game_state) do
    if GameState.is_gameover?(game_state) do
      GameState.evaluate(game_state)
    else
      Enum.min(Enum.map(GameState.get_available_moves(game_state), fn(m) -> max_play(GameState.next_state(game_state, m)) end))
    end
  end

  # Returns the best move for the mininimizing player (ai) once the move
  #   recursion ends.
  def max_play(game_state) do
    if GameState.is_gameover?(game_state) do
      GameState.evaluate(game_state)
    else
      Enum.max(Enum.map(GameState.get_available_moves(game_state), fn(m) -> min_play(GameState.next_state(game_state, m)) end))
    end
  end
end
