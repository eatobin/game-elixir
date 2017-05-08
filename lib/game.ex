defmodule Game do
  def start_game do
    board = [0, 1, 2]
    human_symbol = obtain_symbol()
    # hal_symbol = "H"
    human_turn? = obtain_turn()
    # human_player = Player.make_player(human_symbol, human_turn)
    # computer_player = Player.make_hal(human_player)
    # IO.write(inspect(human_player) <> "\n")
    # IO.write(inspect(computer_player) <> "\n")
    # IO.write(inspect(board) <> "\n")
    # if human_turn? do
    #   symbol = human_symbol
    #   print_board(board)
    #   move = obtain_human_move(board)
    #   new_board = List.replace_at(board, move, symbol)
    #   if(Rules.game_won?(new_board) or Rules.tie?(new_board)) do
    #     print_board(new_board)
    #     IO.write("\n\nThe game is over and #{symbol} won! Thanks for playing.\n\n")
    #   else
    #     print_board(new_board)
    #   end
    # else
    #   symbol = hal_symbol
    #   move = MoveLogic.obtain_hal_move(board)
    #   new_board = List.replace_at(board, move, symbol)
    #   if(Rules.game_won?(new_board) or Rules.tie?(new_board)) do
    #     print_board(new_board)
    #     IO.write("\n\nThe game is over and #{symbol} won! Thanks for playing.\n\n")
    #   else
    #     print_board(new_board)
    #   end
    # end
    play_moves(human_turn?, board, human_symbol)
  end

  def obtain_symbol() do
    p_symbol = IO.gets("Please choose your symbol - anything on the keyboard except digits (0 - 9)\n or 'H' (that's me, I'm Hal): ") |> String.first
    validate_symbol(p_symbol)
  end

  def validate_symbol(p_symbol) do
    bad_symbols  = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "H", "h"]
    if (Enum.member?(bad_symbols, p_symbol)) do
      IO.write("\nSorry, but that symbol is not allowed. Try again...\n\n")
      obtain_symbol()
    else
      p_symbol
    end
  end

  def obtain_turn() do
    h_first = IO.gets("\nDo you want to go first (yes/no): ") |> String.downcase |> String.first
    validate_turn(h_first)
  end

  def validate_turn(h_first) do
    case h_first do
      "y" -> true
      "n" -> false
        _ -> IO.write("\nSorry, but you should type 'yes' or 'no' Try again...\n\n")
             obtain_turn()
    end
  end

  def obtain_human_move(board) do
    h_move = IO.gets("\nWhat number matches your move?: ") |> String.first
    validate_human_move(h_move, board)
  end

  def validate_human_move(h_move, board) do
    if Integer.parse(h_move) != :error and
       Enum.member?(board, String.to_integer(h_move))
    do
      String.to_integer(h_move)
    else
      IO.write("\nSorry, but that is not a valid move - just a number from the board. Try again...\n\n")
      obtain_human_move(board)
    end
  end

  def print_board([x0,x1,x2]) do
    IO.write("\n--------------\n\n")
    IO.write("  #{x0}   #{x1}   #{x2}\n")
    IO.write("\n--------------\n\n")
  end


  def play_moves(human_turn?, board, human_symbol) do
    if human_turn? do
      symbol = human_symbol
      print_board(board)
      move = obtain_human_move(board)
      new_board = List.replace_at(board, move, symbol)
      cond do
        Rules.game_won?(new_board) -> write_game_won(new_board)
        Rules.tie?(new_board) -> write_game_tied(new_board)
        _ -> print_board(new_board)
             play_moves(MoveLogic.toggle_turn(human_turn?), new_board, human_symbol)
      end
    else
      symbol = "H"
      move = MoveLogic.obtain_hal_move(board)
      new_board = List.replace_at(board, move, symbol)
      if(Rules.game_won?(new_board) or Rules.tie?(new_board)) do
        print_board(new_board)
        IO.write("\n\nThe game is over and #{symbol} won! Thanks for playing.\n\n")
      else
        print_board(new_board)
        play_moves(MoveLogic.toggle_turn(human_turn?), new_board, human_symbol)
      end
    end

    def write_game_won(board) do
        print_board(board)
        IO.write("\nThe game is over and #{symbol} won! Thanks for playing.\n")
    end

    def write_game_tied(board) do
        print_board(board)
        IO.write("\nThe game is over and it's a tie! Thanks for playing.\n")

    end
  end








  # def play_moves(human_player, computer_player, board) do
  #   if(Rules.game_won?(board) or Rules.tie?(board)) do
  #     print_board(board)
  #     IO.write("\n\nThe game is over and #{player.p_symbol} won! Thanks for playing.\n\n")
  #   else
  #     play_moves(choose_move(human_player, computer_player, board))
  #   end
  # end
  #
  # def choose_move(player, board) do
  #   cond do
  #     (player.p_symbol == "H") and
  #       player.my_turn -> Player.get_hal_move(player, board)
  #     (player.p_symbol != "H") and
  #       player.my_turn -> Player.get_hal_move(player, board)
  #   end
  # end
  #
  # def toggle_player(player) do
  #   if(player == "X") do
  #     "O"
  #   else
  #     "X"
  #   end
  # end
  #
  # def get_humans_turn(board) do
  #   IO.write("Enter [0-8]")
  #   next_move = IO.gets(">")
  #   {num, _} = Integer.parse(next_move)
  #
  #   # if its a free space
  #   if Enum.at(board, num) != "X" && Enum.at(board, num) != "O" do
  #     updated_board = List.update_at(board, num, fn(_x) -> "X" end)
  #     print_board(updated_board)
  #     updated_board
  #   else
  #     get_humans_turn(board)
  #   end
  # end
  #
  # def get_computers_turn(board) do
  #   if Enum.at(board, 4) == 4 do
  #     new_board = List.update_at(board, 4, fn(_x) -> "O" end)
  #     print_board(new_board)
  #     new_board
  #   else
  #     comp_turn = evaluate(board)
  #     new_board = List.update_at(board, comp_turn, fn(_x) -> "O" end)
  #     print_board(new_board)
  #     new_board
  #   end
  # end
  #
  # def evaluate(board) do
  #   indexed_board = Enum.with_index(board, 0)
  #   filtered = Enum.filter(indexed_board, fn({value, _}) -> value != "X" && value != "O" end)
  #   #choose a space for next move
  #   available_moves = Enum.map(filtered, fn({_value, index}) -> index end)
  #   get_best_move(available_moves, board)
  # end
  #
  # def get_best_move([first|[]], _board) do
  #   first
  # end
  #
  # def get_best_move([first_index|rest], board) do
  #   cond do
  #     Rules.game_won?(List.replace_at(board, first_index, "O")) -> first_index
  #     Rules.game_won?(List.replace_at(board, first_index, "X")) -> first_index
  #     true -> get_best_move(rest, board)
  #   end
  # end
end
