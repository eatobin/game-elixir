ExUnit.start()

defmodule ValidationsTest do
  use ExUnit.Case, async: true

  test "human symbol is valid" do
    # Enter a valid symbol
    assert Validations.validate_a_symbol({"E", :human, nil}) == "E"
    # Invalid symbol requires a recursive function call - not tested
    #   (but would like to learn how!)
  end

  test "ai symbol is valid" do
    # Enter a valid symbol
    assert Validations.validate_a_symbol({"C", :ai, "E"}) == "C"
    # Invalid symbol requires a recursive function call - not tested
    #   (but would like to learn how!)
  end

  test "human first (y or n) is valid" do
    # Enter a y
    assert Validations.validate_turn("y", "E", "C") == "E"
    # Enter a n
    assert Validations.validate_turn("n", "E", "C") == "C"
    # Invalid symbol requires a recursive function call - not tested
    #   (but would like to learn how!)
  end

  test "valid human move (a digit still on the board) is valid" do
    # Enter a valid open move
    assert Validations.validate_human_move("3", ["X", "X", "X", 3]) == 3
    # Invalid symbol requires a recursive function call - not tested
    #   (but would like to learn how!)
  end
end
