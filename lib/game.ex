defmodule Game do
  def start_game do
    b = [0, 1, 2, 3, 4, 5, 6, 7, 8]
    print_board(b)
    play_moves(b, "X")
  end

  def print_board([x0,x1,x2,x3,x4,x5,x6,x7,x8]) do
    IO.write("\n--------------\n\n")
    IO.write("  #{x0}   #{x1}   #{x2}\n ===+===+=== \n  #{x3}   #{x4}   #{x5}\n ===+===+=== \n  #{x6}   #{x7}   #{x8}\n")
    IO.write("\n--------------\n\n")
  end

  def play_moves(board, player) do
    if(Rules.game_over?(board) || Rules.tie?(board)) do
      IO.write("Game Over\n")
    else
      play_moves(choose_move(board, player), toggle_player(player))
    end
  end

  def choose_move(board, player) do
    cond do
      player == "X" -> get_humans_turn(board)
      player == "O" -> get_computers_turn(board)
    end
  end

  def toggle_player(player) do
    if(player == "X") do
      "O"
    else
      "X"
    end
  end

  def get_humans_turn(board) do
    IO.write("Enter [0-8]")
    next_move = IO.gets(">")
    {num, _} = Integer.parse(next_move)

    # if its a free space
    if Enum.at(board, num) != "X" && Enum.at(board, num) != "O" do
      updated_board = List.update_at(board, num, fn(_x) -> "X" end)
      print_board(updated_board)
      updated_board
    else
      get_humans_turn(board)
    end
  end

  def get_computers_turn(board) do
    if Enum.at(board, 4) == 4 do
      new_board = List.update_at(board, 4, fn(_x) -> "O" end)
      print_board(new_board)
      new_board
    else
      comp_turn = evaluate(board)
      new_board = List.update_at(board, comp_turn, fn(_x) -> "O" end)
      print_board(new_board)
      new_board
    end
  end

  def evaluate(board) do
    indexed_board = Enum.with_index(board, 0)
    filtered = Enum.filter(indexed_board, fn({value, _}) -> value != "X" && value != "O" end)
    #choose a space for next move
    available_moves = Enum.map(filtered, fn({_value, index}) -> index end)
    get_best_move(available_moves, board)
  end

  def get_best_move([first|[]], _board) do
    first
  end

  def get_best_move([first_index|rest], board) do
    cond do
      Rules.game_over?(List.replace_at(board, first_index, "O")) -> first_index
      Rules.game_over?(List.replace_at(board, first_index, "X")) -> first_index
      true -> get_best_move(rest, board)
    end
  end

  # check for tie board
  # returns: true or false
  # def Rules.tie?(board) do
  #   Enum.all?(board, fn(x) -> is_bitstring(x) end)
  # end

  # check for winning row using short-circuit eval
  # and pure bools
  # returns: true or false
  # def Rules.game_over?([x0,x1,x2,x3,x4,x5,x6,x7,x8]) do
  #   (x0 == x1) and (x1 == x2) or
  #   (x3 == x4) and (x4 == x5) or
  #   (x6 == x7) and (x7 == x8) or
  #   (x0 == x3) and (x3 == x6) or
  #   (x1 == x4) and (x4 == x7) or
  #   (x2 == x5) and (x5 == x8) or
  #   (x0 == x4) and (x4 == x8) or
  #   (x2 == x4) and (x4 == x6)
  # end
end
