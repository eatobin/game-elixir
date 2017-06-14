defmodule Minimax do
  @moduledoc """
  lets visualize the above game state

                                     O |   | X
                                     ---------
                                     X |   | X
                                     ---------
                                       | O | O

                               //       ||        \\

                  O | X | X          O |   | X        O |   | X
                  ---------          ---------        ---------
                  X |   | X          X | X | X        X |   | X
                  ---------          ---------        ---------
                    | O | O            | O | O        X | O | O

                //          \\                     //          \\

          O | X | X          O | X | X        O | O | X       O |   | X
          ---------          ---------        ---------       ---------
          X | O | X          X |   | X        X |   | X       X | O | X
          ---------          ---------        ---------       ---------
            | O | O          O | O | O        X | O | O       X | O | O

                                          //

                                     O | O | X
                                     ---------
                                     X | X | X
                                     ---------
                                     O | O | O
  """

  @orig_board ["O",1,"X","X",4,"X",6,"O","O"]

  # human
  @hu_player "O"

  # ai
  @ai_player "X"

  # keeps count of function calls
  # fc = 0

  # finding the ultimate play on the game that favors the computer
  # best_spot = minimax(orig_board, ai_player)

  @doc """
  the main minimax function
  """
  def minimax(new_board, player) do
    # available spots
    avail_spots = empty_indexies(new_board)

    score =
      cond do
        Minimax.winning(new_board, @hu_player) -> -10
        Minimax.winning(new_board, @ai_player) -> 10
        true -> 0
      end
    moves = []
  end

  @doc """
  returns list of the indexes of empty spots on the board
  """
  def empty_indexies(board) do
    Enum.filter(board, fn(x) -> is_integer(x) end)
  end

  @doc """
  winning combinations using the board indexies
  """
  def winning([x0,x1,x2,x3,x4,x5,x6,x7,x8], player) do
    (x0 == player) and (x1 == player) and (x2 == player) or
    (x3 == player) and (x4 == player) and (x5 == player) or
    (x6 == player) and (x7 == player) and (x8 == player) or
    (x0 == player) and (x3 == player) and (x6 == player) or
    (x1 == player) and (x4 == player) and (x7 == player) or
    (x2 == player) and (x5 == player) and (x8 == player) or
    (x0 == player) and (x4 == player) and (x8 == player) or
    (x2 == player) and (x4 == player) and (x6 == player)
  end
end
