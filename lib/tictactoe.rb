# frozen_string_literal: true

# class definition: Main game logic
class TicTacToe
  def initialize
    @player_one = Player.new(name: 'Player 1'.colorize(:blue), icon: 'X'.colorize(:blue))
    @player_two = Player.new(name: 'Player 2'.colorize(:yellow), icon: 'O'.colorize(:yellow))
    @board = Board.new
    @current_player = @player_one
    @player_choice = 0
  end

  def self.start
    game = TicTacToe.new
    game.play
  end

  def play
    until end_condition?
      clear_screen
      @board.display # display current board, prompt current player
      prompt_choice
      change_turn unless end_condition?
      puts
    end
    end_game if end_condition?
  end

  private

  def prompt_choice
    ask_player(@current_player.name)
    @player_choice = gets.chomp.to_i - 1
    if valid_move?
      process_choice
    else
      prompt_choice
    end
  end

  def process_choice
    @board.place_icon(@player_choice, @current_player.icon)
  end

  def valid_move?
    number_in_range? &&
      @board.cell_available?(@player_choice)
  end

  def number_in_range?
    @player_choice.between?(0, 8)
  end

  def winner?
    @board.winning_pattern?
  end

  def draw?
    @board.full? && !winner?
  end

  def end_condition?
    winner? || draw?
  end

  def change_turn
    @current_player = (@current_player == @player_one ? @player_two : @player_one)
  end

  def clear_screen
    puts "\e[H\e[2J"
  end

  def ask_player(current_player_name)
    puts "#{current_player_name} - Please choose a number 1-9 to play your marker"
  end

  def end_game
    clear_screen
    if winner?
      puts "#{@current_player.name} has won!"
    else
      puts 'Game is a draw!'
    end
    puts
    @board.display
  end
end
