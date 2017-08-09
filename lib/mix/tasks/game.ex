defmodule Mix.Tasks.Game do
  use Mix.Task

  def run(_) do
    Game.start_game
  end
end
