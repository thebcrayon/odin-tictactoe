# frozen_string_literal: true

# class definition: Main game logic
class TicTacToe
  def initialize
    @player_one = Player.new(name: 'Player 1'.colorize(:blue), icon: 'X'.colorize(:blue))
    @player_two = Player.new(name: 'Player 2'.colorize(:yellow), icon: 'O'.colorize(:yellow))
    @board = Board.new
    @current_player = @player_one
  end

  def self.start
    game = TicTacToe.new
    game.play
  end

  def play
    until end_condition?
      clear_screen
      @board.display # display current board, prompt current player
      take_turn
      puts
    end
    end_game if end_condition?
  end

  private

  def take_turn
    loop do
      choice = prompt_choice

      if @board.cell_available?(choice)
        process_choice(choice)
        change_turn unless end_condition?
        break
      else
        puts 'That cell is already taken'
      end
    end
  end

  def prompt_choice
    loop do
      puts "#{@current_player.name} Please enter a number 1-9"
      input = gets.chomp.to_i - 1

      break input if input.between?(0, 8)

      puts 'Incorrect, please try again...'
    end
  end

  def process_choice(choice)
    @board.place_icon(choice, @current_player.icon)
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
