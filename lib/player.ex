defmodule Player do
  defstruct [:p_symbol, :my_turn]

  def make_player(ps, mt) do
    %Player{p_symbol: ps, my_turn: mt}
  end

  def toggle_turn(player) do
    if (player.my_turn == false) do
      %{player | my_turn: true}
    else
      %{player | my_turn: false}
    end
  end

  def make_hal(human) do
    make_player("H", !(human.my_turn))
  end
end
