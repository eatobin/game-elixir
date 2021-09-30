defmodule Game do
  # This module is the main module. It sets up and then plays the game. This
  #   module is where the program IO takes place and is functionally "impure".
  #   It is not tested for this reason. Should it be?
  # start_game is the entry point
  def start_game do
    # Resize the console to highlight move sequences and remove visual clutter.
    IO.write(IO.ANSI.clear() <> "\e[8;27;65t")
    human_symbol = obtain_human_symbol()
    ai_symbol = obtain_ai_symbol(human_symbol)
    turn_symbol = obtain_first_turn(human_symbol, ai_symbol)

    game_state = %GameState{
      board: [0, 1, 2, 3, 4, 5, 6, 7, 8],
      player: turn_symbol,
      depth: 0,
      human_symbol: human_symbol,
      ai_symbol: ai_symbol
    }

    IO.write(IO.ANSI.clear() <> "Here is the opening game board:\n")
    print_board(game_state.board)
    play_moves(game_state)
  end

  # Get a symbol to be used on the board for human player.
  def obtain_human_symbol() do
    human_symbol =
      IO.gets(
        "\nWelcome to Tic-Tac-Toe!\n\nPlease choose your symbol\n  - anything on the keyboard except digits (0 - 9)\n  - or an empty entry (<Enter> only): "
      )
      |> String.first()

    Validations.validate_a_symbol({human_symbol, :human, nil})
  end

  # Get a symbol to be used on the board for ai player.
  def obtain_ai_symbol(human_symbol) do
    ai_symbol =
      IO.gets("\nSame for the symbol you'd like the computer to use: ") |> String.first()

    Validations.validate_a_symbol({ai_symbol, :ai, human_symbol})
  end

  # Ask if the human player wants to go first.
  # Takes input, downcases it and takes head of string.
  def obtain_first_turn(human_symbol, ai_symbol) do
    human_first =
      IO.gets("\nDo you want to go first (yes/no): ") |> String.downcase() |> String.first()

    Validations.validate_turn(human_first, human_symbol, ai_symbol)
  end

  # Ask the human which of the available moves (numbers) they'd like.
  def obtain_human_move(game_state) do
    human_move = IO.gets("\nWhat number matches your move?: ") |> String.first()
    Validations.validate_human_move(human_move, game_state.board)
  end

  # Main game play logic - cycles until a win or tie...
  def play_moves(game_state) do
    move =
      cond do
        # human turn.
        game_state.player == game_state.human_symbol -> obtain_human_move(game_state)
        # ai turn.
        true -> elem(Minimax.minimax(game_state), 0)
      end

    new_board = List.replace_at(game_state.board, move, game_state.player)
    # Mark the current move in red and reset after.
    display_board =
      List.replace_at(new_board, move, [IO.ANSI.red(), game_state.player, IO.ANSI.reset()])

    if game_state.player == game_state.human_symbol do
      IO.write("\nOkay, here's your move:\n")
    else
      IO.write("\nAnd here's my move:\n")
    end

    print_board(display_board)
    # If game over display winner of tie message.
    cond do
      GameState.won?(%{game_state | board: new_board}) ->
        IO.write(
          "\nThe game is over and " <>
            IO.ANSI.red() <>
            "<<< #{game_state.player} >>>" <> IO.ANSI.reset() <> " won! Thanks for playing.\n\n"
        )

      GameState.is_gameover?(%{game_state | board: new_board}) ->
        IO.write(
          "\nThe game is over and " <>
            IO.ANSI.red() <>
            "<<< it's a tie! >>>" <> IO.ANSI.reset() <> " Thanks for playing.\n\n"
        )

      true ->
        play_moves(%{game_state | board: new_board, player: GameState.toggle_player(game_state)})
    end
  end

  def print_board([x0, x1, x2, x3, x4, x5, x6, x7, x8]) do
    IO.write("\n--------------\n\n")

    IO.write(
      "  #{x0}   #{x1}   #{x2}\n ===+===+=== \n  #{x3}   #{x4}   #{x5}\n ===+===+=== \n  #{x6}   #{x7}   #{x8}\n"
    )

    IO.write("\n--------------\n")
  end
end
