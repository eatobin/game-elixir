defmodule Rules do
  # check for tie board
  # returns: true or false
  def tie?(board) do
    Enum.all?(board, fn(x) -> is_bitstring(x) end)
  end

  # check for winning row using short-circuit eval
  # and pure bools
  # returns: true or false
  def game_over?([x0,x1,x2,x3,x4,x5,x6,x7,x8]) do
    (x0 == x1) and (x1 == x2) or
    (x3 == x4) and (x4 == x5) or
    (x6 == x7) and (x7 == x8) or
    (x0 == x3) and (x3 == x6) or
    (x1 == x4) and (x4 == x7) or
    (x2 == x5) and (x5 == x8) or
    (x0 == x4) and (x4 == x8) or
    (x2 == x4) and (x4 == x6)
  end
end
