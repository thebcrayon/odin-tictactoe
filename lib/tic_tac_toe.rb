# frozen_string_literal: true

# This is information about the game itself
# It should keep track of gamestart, gamefinish
# number of players, number of rounds, score,
# current player turn
class TicTacToe
  def initialize(players, board_ui, number_of_rounds)
    @is_active = nil
    @number_of_rounds = number_of_rounds
    @player_one = players[0]
    @player_two = players[1]
    @current_player = @player_one
    @current_choice = 0
    @ui = board_ui
    start_round
    msg_welcome
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
    [players, board_ui, number_of_rounds.to_i]
  end

  def msg_welcome
    clear_screen
    puts "Welcome #{@player_one.name}(x's) and #{@player_two.name}(o's). Best out of #{@number_of_rounds} wins!"
    puts "\n"
  end

  def msg_next_player
    msg_welcome
    puts "\nPlayer turn: #{@current_player.name}"
    puts "Select the Number where you want to move: \n"
    puts "\n"
  end

  def msg_winner
    msg_welcome
    puts "#{@current_player.name} wins this round!"
    puts "\n"
  end

  def clear_screen
    puts "\e[H\e[2J"
  end

  def change_player_turn
    @current_player = @current_player == @player_one ? @player_two : @player_one
  end

  def check_for_winner
    if @ui.contains_a_set?(@current_player.icon) == true
      end_round
    else
      change_player_turn
    end
  end

  def start_round
    @is_active = true
  end

  def end_round
    @is_active = false
    clear_screen
    msg_winner
    @ui.print_current_board
    @current_player.add_point
  end

  def play_round
    while @is_active
      msg_next_player
      @ui.print_current_board
      @current_choice = gets.chomp
      @ui.process_choice(@current_choice, @current_player.icon)
      check_for_winner
      clear_screen unless @is_active == false
    end
  end
end
