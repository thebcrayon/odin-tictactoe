# frozen_string_literal: true

# This is information about the game itself
# It should keep track of gamestart, gamefinish
# number of players, number of rounds, score,
# current player turn
class TicTacToe
  def initialize(players, board_ui, number_of_rounds)
    @is_active = true
    @number_of_rounds = number_of_rounds
    @players = players
    @player_one = @players[0]
    @player_two = @players[1]
    @current_player = @player_one
    @ui = board_ui
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
    puts "Welcome #{@player_one.name}(x's) and #{@player_two.name}(o's). Best out of #{@number_of_rounds} wins!"
  end

  def msg_next_player
    puts "\nPlayer turn: #{@current_player.name}"
    puts "Select the Number where you want to move: \n"
    puts "\n"
  end

  def change_player_turn
    @current_player = @current_player == @player_one ? @player_two : @player_one
  end

  def play_round
    while @is_active
      msg_next_player
      @ui.print_current_board
      @ui.process_choice(gets.chomp, @current_player.icon) # grabbing current players and choice
      change_player_turn
      puts "\e[H\e[2J"
    end
  end
end
