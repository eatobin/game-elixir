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

  # @orig_board ["X","O","X","O","O","X",6,7,8]

  # human
  @player "X"

  # ai
  @opponent "O"

def is_moves_left?(board) do
  Enum.any?(board, fn(x) -> is_integer(x) end)
end

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
  def winning([x0,x1,x2,x3,x4,x5,x6,x7,x8]) do
    cond do
      (x0 == x1) and (x1 == x2) or
      (x3 == x4) and (x4 == x5) or
      (x6 == x7) and (x7 == x8) or
      (x0 == x3) and (x3 == x6) or
      (x1 == x4) and (x4 == x7) or
      (x2 == x5) and (x5 == x8) or
      (x0 == x4) and (x4 == x8) or
      (x2 == x4) and (x4 == x6) and
      # x0 == @player -> 10
      # player == @opponent -> -10
      true -> 0
    end
  end
end
