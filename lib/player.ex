defmodule Player do
  defstruct [:p_symbol, :goes_first, :my_turn]

  @bad_symbols ["0", "1", "2", "3", "4", "5", "6", "7", "8"]

  def make_player(ps, gf, mt) do
    %Player{p_symbol: ps, goes_first: gf, my_turn: mt}
  end

  def obtain_symbol() do
    p_symbol = IO.gets("Please choose your symbol (anything except the numbers 0 - 8): ") |> String.first
    validate_symbol(p_symbol)
  end

  def validate_symbol(p_symbol) do
    if (Enum.member?(@bad_symbols, p_symbol)) do
      IO.write("\nSorry, but that symbol is not allowed. Try again...\n\n")
      obtain_symbol()
    else
      p_symbol
    end
  end
end
