defmodule Minimax do

  # o = %GameState{board: ["O","a","b","c","O","d","e","f",8], player: "O"}
  # x = %GameState{board: ["X","a","b","c","X","d","e","f",8], player: "X"}
  # o1 = %GameState{board: ["O","a","b","c","O","d",6,"f",8], player: "O"}
  # x1 = %GameState{board: ["X","a","b","c","X","d",6,"f",8], player: "X"}
  # o_start = %GameState{board: [0,1,2,3,4,5,6,7,8], player: "O"}
  # o_one = %GameState{board: ["X",1,2,3,"O",5,6,7,8], player: "O"}
  # sample = %GameState{board: ["O",1,"X","X",4,5,"X","O","O"], player: "X"}
  # sample2 = %GameState{board: [0,"X",2,3,4,"X","O","O","X"], player: "O"}
  # sample3 = %GameState{board: ["O",1,"X","X",4,"X",6,"O","O"], player: "X"}

  # min_play = opposing player
  # max_play = currnt player

  # maximize - ai
  @player "X"

  # minimize - human
  @opponent "O"

  def evaluate(game_state) do
    player = toggle_player(game_state.player)
    cond do
      won?(game_state) and player == @player -> 10
      won?(game_state) and player == @opponent -> -10
      true -> 0
    end
  end

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
    Enum.all?(game_state.board, fn(s) -> is_bitstring(s) end)
  end

  def min_play(game_state) do
    if is_gameover(game_state) do
      evaluate(game_state)
    else
      Enum.min(Enum.map(get_available_moves(game_state), fn(m) -> max_play(next_state(game_state, m)) end))
    end
  end

  def max_play(game_state) do
    if is_gameover(game_state) do
      evaluate(game_state)
    else
      Enum.max(Enum.map(get_available_moves(game_state), fn(m) -> min_play(next_state(game_state, m)) end))
    end
  end

  def minimax(game_state) do
    # Enum.max_by(Enum.map(get_available_moves(game_state), fn(m) -> {m, min_play(next_state(game_state, m))} end), fn({_i, v}) -> v end)
    Enum.map(get_available_moves(game_state), fn(m) -> {m, min_play(next_state(game_state, m))} end)
  end

  def toggle_player(p) do
    if p == @player do
      @opponent
    else
      @player
    end
  end
end
