defmodule Mix.Tasks.Game do
  use Mix.Task

  @shortdoc "Run the game"
  def run(_) do
    Game.start_game()
  end
end
