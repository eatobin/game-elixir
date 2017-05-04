defmodule Player do
  defstruct [:p_symbol, :my_turn]

  def make_player(ps, mt) do
    %Player{p_symbol: ps, my_turn: mt}
  end

  def make_hal(human) do
    make_player("H", !(human.my_turn))
  end
end
