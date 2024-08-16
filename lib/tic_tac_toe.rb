# frozen_string_literal: true

require_relative 'messages'
# This is information about the game itself
# It should keep track of gamestart, gamefinish
# number of players, number of rounds, score,
# current player turn
class TicTacToe
  include Messages

  def initialize(game_data)
    @round_winner = nil
    @is_tie = nil
    @current_choice = nil
    @ties = 0
    @number_of_rounds = game_data[2]
    @player_one = game_data[0][0]
    @player_two = game_data[0][1]
    @current_player = @player_one
    @ui = game_data[1]
  end

  def self.game_data(board_ui)
    game_prompts = ['Player 1 Enter Name:', 'Player 2 Enter Name:', 'How many games?']
    game_data = []
    game_prompts.each do |prompt|
      puts prompt
      game_data << gets.chomp
    end
    players = [Player.new(game_data[0], 'x', 'yellow'), Player.new(game_data[1], 'o', 'blue')]
    number_of_rounds = game_data[2]
    TicTacToe.new([players, board_ui, number_of_rounds.to_i])
  end

  def play
    1.upto(total_rounds) do |i|
      start_round
      play_round(i)
      msg_finish_game if i == total_rounds
      clear_screen
    end
  end

  private

  attr_reader :number_of_rounds, :player_one, :player_two

  def total_rounds
    @number_of_rounds
  end

  def play_round(round)
    until @round_winner || @tie
      puts "Round: #{round}"
      msg_welcome
      msg_next_player
      msg_print_board
      msg_prompt_choice
      process_user_choice
      change_player_turn
      clear_screen unless @round_winner || @tie
    end
  end

  def process_user_choice
    @ui.process_choice(@current_choice, @current_player.icon)
    if winner?
      @round_winner = true
      end_round
    elsif tie?
      @tie = true
      end_round
    end
  end

  def clear_screen
    puts "\e[H\e[2J"
  end

  def start_round
    @round_winner = false
    @tie = false
  end

  def end_round
    clear_screen
    @ui.print_current_board
    msg_winner if @round_winner
    msg_tie if @tie
    msg_next_round unless @tie
    @current_player.add_point if @round_winner
    @ties += 1 unless @round_winner
    @ui.reset_board
  end

  def change_player_turn
    @current_player = @current_player == @player_one ? @player_two : @player_one
  end

  def winner?
    @ui.contains_a_set?(@current_player.icon)
  end

  def tie?
    @ui.board_full?
  end
end
