# frozen_string_literal: true

require_relative 'messages'

# This is information about the game itself
# It should keep track of gamestart, gamefinish
# number of players, number of rounds, score,
# current player turn
class TicTacToe
  attr_reader :is_active

  include Messages

  def initialize(number_of_rounds, board_ui, players)
    @is_active = true
    @number_of_rounds = number_of_rounds
    @players = players
    @active_player = players[0]
    @ui = board_ui
    welcome_players
  end

  def welcome_players
    msg_welcome(@players, @number_of_rounds)
  end

  def start
    @is_active = true
  end

  def end
    @is_active = false
  end

  def msg_next_player
    puts "Current Player: #{@active_player.name} choose a space."
    @ui.print_current_state
  end
end
