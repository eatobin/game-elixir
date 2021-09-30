defmodule Validations do
  # check to be sure player symbol is not a number (numbers are
  #   open moves.
  # sender gets return if invalid input
  def validate_a_symbol({symbol, sender, human_symbol}) do
    bad_symbols = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "\n"]

    if Enum.member?(bad_symbols, symbol) or (sender == :ai and symbol == human_symbol) do
      IO.write("\nSorry, but that (non)symbol is not allowed. Try again...\n")

      if sender == :ai do
        Game.obtain_ai_symbol(human_symbol)
      else
        Game.obtain_human_symbol()
      end
    else
      symbol
    end
  end

  # check to be sure human first query is a 'y' or 'n'
  # translates input to boolean
  def validate_turn(human_first, human_symbol, ai_symbol) do
    case human_first do
      "y" ->
        human_symbol

      "n" ->
        ai_symbol

      _ ->
        IO.write("\nSorry, but you should type 'yes' or 'no' Try again...\n")
        Game.obtain_first_turn(human_symbol, ai_symbol)
    end
  end

  # Validate that human move is a number and that it is a number
  #   still on the board
  def validate_human_move(human_move, board) do
    if Integer.parse(human_move) != :error and
         Enum.member?(board, String.to_integer(human_move)) do
      String.to_integer(human_move)
    else
      IO.write(
        "\nSorry, but that is not a valid move - just a number that's an available move from the board. Try again...\n"
      )

      Game.obtain_human_move(board)
    end
  end
end
