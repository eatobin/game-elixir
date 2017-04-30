defmodule Player do
  defstruct [:p_symbol, :goes_first, :my_turn]

  def make_player(ps, gf, mt) do
    %Player{p_symbol: ps, goes_first: gf, my_turn: mt}
  end

  def toggle_turn(player) do
    if (player.my_turn == false) do
      %{player | my_turn: true}
    else
      %{player | my_turn: false}
    end
  end
end
