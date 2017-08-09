defmodule GameState do
  # The heart of this program is this data structure. It holds the current state
  #   of the board, the player who's turn is next, how deep into the minimax
  #   algorithm we are (The earlier the victory, the more valuable the move.)
  #   and what the human and ai board symbols are. :board,
  #   :player and :depth change after each iteration. Given this struct a
  #   function knows everything about the game state.
  defstruct [:board, :player, :depth, :human_symbol, :ai_symbol]

  # Returns a list of all remaining moves on the board.
  def get_available_moves(game_state) do
    Enum.filter(game_state.board, fn(x) -> is_integer(x) end)
  end

  # Returns true if no moves remain. False otherwise. (Easier than:
  #   length(get_available_moves) == 0. I think...). Used to check for a tie.
  def all_taken?(game_state) do
    Enum.all?(game_state.board, fn(s) -> is_bitstring(s) end)
  end

  # Returns an new GameState with an updated :board, the next :player up and an incremented :depth.
  def next_state(game_state, move) do
    %{game_state | board: List.replace_at(game_state.board, move, game_state.player), player: toggle_player(game_state), depth: game_state.depth + 1}
  end

  # Returns true if a winning pattern is detected for either party. False otherwise.
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

  # Returns true if the game has been won by either player or there is a tie.
  #   False otherwise.
  def is_gameover?(game_state) do
    cond do
      won?(game_state) -> true
      !won?(game_state) and all_taken?(game_state) -> true
      true -> false
    end
  end

  # Looks at the last player who moved when game ends. If game was won by the human,
  #   returns score of depth - 10 (negative #). If game was won by ai,
  #   returns score of 10 - depth (positive #). Otherwise a tie = 0.
  def evaluate(game_state) do
    cond do
      won?(game_state) and toggle_player(game_state) == game_state.ai_symbol -> 10 - game_state.depth
      won?(game_state) and toggle_player(game_state) == game_state.human_symbol -> game_state.depth - 10
      true -> 0
    end
  end

  # Flip the current player for use by next_state and Game.play_moves.
  def toggle_player(game_state) do
    if game_state.player == game_state.ai_symbol do
      game_state.human_symbol
    else
      game_state.ai_symbol
    end
  end
end
