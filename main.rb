# frozen_string_literal: true

require_relative 'lib/tic_tac_toe'
require_relative 'lib/board_ui'
require_relative 'lib/player'

require 'colorize'

# Initialize Game
# This game first needs to gather player information
game_data = TicTacToe.game_data(BoardUI.new)
player_one = game_data[0][0]
player_two = game_data[0][1]
board_ui = game_data[1]
number_of_rounds = game_data[2]

game = TicTacToe.new([player_one, player_two], board_ui, number_of_rounds)

# Main Logic Loop
# Then print out the current state of the board and prompt turn
# Player makes a choice, Error testing against avaiable spaces
# Player icon is stored in array of spaces
# Board is updated, End Game winner = false
# Print out the current state
game.play_round

# End Game
# Winner declared
# Point added to Player who won
# Check overall wins against series number
# If best of not met, play game
