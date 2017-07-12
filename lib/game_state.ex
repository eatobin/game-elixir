defmodule GameState do
  # defstruct board: [], player: "", depth: 0
  # defstruct board: [], player: "X", depth: 0, h_sym: "O", ai_sym: "X"
  defstruct [:board, :player, :depth, :h_sym, :ai_sym]
end
