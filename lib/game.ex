defmodule Game do
  def start_game do
    board = [0, 1, 2, 3, 4, 5, 6, 7, 8]
    human_symbol = obtain_symbol()
    human_turn? = obtain_turn()
    IO.write("\nHere is the opening game board:\n")
    print_board(board)
    play_moves(human_turn?, board, human_symbol)
  end

  def obtain_symbol() do
    p_symbol = IO.gets("Please choose your symbol - anything on the keyboard except digits (0 - 9)\n or 'H' (that's me, I'm Hal): ") |> String.first
    validate_symbol(p_symbol)
  end

  def validate_symbol(p_symbol) do
    bad_symbols  = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "H", "h"]
    if (Enum.member?(bad_symbols, p_symbol)) do
      IO.write("\nSorry, but that symbol is not allowed. Try again...\n")
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
        _ -> IO.write("\nSorry, but you should type 'yes' or 'no' Try again...\n")
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
      IO.write("\nSorry, but that is not a valid move - just a number that's an available move from the board. Try again...\n")
      obtain_human_move(board)
    end
  end

  def play_moves(human_turn?, board, human_symbol) do
    symbol =
      cond do
        human_turn? -> human_symbol
        true -> "H"  
      end
    move =
      cond do
        human_turn? -> obtain_human_move(board)
        true -> MoveLogic.obtain_hal_move(board)
      end
    new_board = List.replace_at(board, move, symbol)
    if human_turn? do
      IO.write("\nOkay, here's your move:\n")
    else
      IO.write("\nAnd here's my move:\n")
    end
    print_board(new_board)
    cond do
      Rules.game_won?(new_board) ->
        IO.write("\nThe game is over and #{symbol} won! Thanks for playing.\n")
      Rules.tie?(new_board) ->
        IO.write("\nThe game is over and it's a tie! Thanks for playing.\n")
      true -> play_moves(MoveLogic.toggle_turn(human_turn?), new_board, human_symbol)
    end
  end

  def print_board([x0,x1,x2,x3,x4,x5,x6,x7,x8]) do
    IO.write("\n--------------\n\n")
    IO.write("  #{x0}   #{x1}   #{x2}\n ===+===+=== \n  #{x3}   #{x4}   #{x5}\n ===+===+=== \n  #{x6}   #{x7}   #{x8}\n")
    IO.write("\n--------------\n")
  end
end


