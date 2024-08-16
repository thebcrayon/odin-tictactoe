# frozen_string_literal: true

require_relative 'lib/tic_tac_toe'
require_relative 'lib/board_ui'
require_relative 'lib/player'

require 'colorize'

# Initialize Game
# This game first needs to gather player information
game = TicTacToe.game_data(BoardUI.new)
game.play
