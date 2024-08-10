# frozen_string_literal: true

require_relative 'lib/tic_tac_toe'
require_relative 'lib/board_ui'
require_relative 'lib/player'

players = [Player.new('Justin'), Player.new('Riley')]
gameboard = BoardUI.new
game = TicTacToe.new(3, gameboard, players)
p game.msg_next_player
gameboard.board[0][2 - 1] = 'x'
p game.msg_next_player
