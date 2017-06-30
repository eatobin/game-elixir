# The general syntax of a lambda function is quite simple:
# lambda argument_list: expression
# The argument list consists of a comma separated list of arguments and the expression is an arithmetic expression using these arguments. You can assign the function to a variable to give it a name.
# The following example of a lambda function returns the sum of its two arguments:

# >>> f = lambda x, y : x + y
# >>> f(1,1)
# 2

# Imagine you have objects with some attribute you want to use to get the minimum value:

# min(my_objects, key=lambda x: x.something)
# This will give you the object with the smallest something attribute.

map(fn, list)
f = lambda x, y : x + y

a = [1,2,3,4]
b = [17,12,11,10]
c = [-1,-4,5,9]
map(lambda x, y : x + y, a, b)
# [18, 14, 14, 14]

def min_play(game_state):
  if game_state.is_gameover():
    return evaluate(game_state)

def min_play(game_state):
  if game_state.is_gameover():
    return evaluate(game_state)
  return min(scores) # Incomplete

def min_play(game_state):
  if game_state.is_gameover():
    return evaluate(game_state)
  return min(
    map(lambda move: max_play(game_state.next_state(move)),
      game_state.get_available_moves()))

# To account for the additional requirement in the minimax() procedure,
# we modify the lambda of map() and the key of max() accordingly.
# That is, we begin by defining the lambda to be given a move and return
# a tuple containing (move, score).
# Furthermore, now that we have a tuple, we must decide which parameter to
# minimize over. We define this the key using the key keyword argument of max().
# The final procedure is defined below:
def minimax(game_state):
  return max(
    map(lambda move: (move, min_play(game_state.next_state(move))),
      game_state.get_available_moves()),
    key = lambda x: x[1])


# Total!
def minimax(game_state):
  return max(
    map(lambda move: (move, min_play(game_state.next_state(move))), 
      game_state.get_available_moves()), 
    key = lambda x: x[1])

def min_play(game_state):
  if game_state.is_gameover():
    return evaluate(game_state)
  return min(
    map(lambda move: max_play(game_state.next_state(move)),
      game_state.get_available_moves()))

def max_play(game_state):
  if game_state.is_gameover():
    return evaluate(game_state)
  return max(
    map(lambda move: min_play(game_state.next_state(move)),
      game_state.get_available_moves()))
