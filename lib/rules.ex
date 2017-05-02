defmodule Rules do
  # check for tie board
  # returns: true or false
  def tie?(board) do
    Enum.all?(board, fn(x) -> is_bitstring(x) end)
  end

  # check for winning row using short-circuit eval
  # and pure bools
  # returns: true or false
  def game_over?([x0,_x1,x2]) do
    x0 == x2
  end
end
