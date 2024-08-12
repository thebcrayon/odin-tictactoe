# frozen_string_literal: true

# This board class will keep track
# of player choices, check for seqence of 3,
# show information about what spaces are vailable
# and what spaces are not. 'colorize' for color of player icons.
class BoardUI
  attr_accessor :board

  def initialize
    @board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  end

  def print_current_board
    @board.each_with_index do |row, row_index|
      puts "\t  #{row.join(' | ')} "
      puts "\t –––––––––––" unless row_index == row.size - 1
    end
  end

  def process_choice(player_choice, player_icon)
    player_choice_int = player_choice.to_i
    if (player_choice_int != 0) && (choice_available?(player_choice_int) == true)
      update_board(player_choice_int, player_icon)
    else
      puts "'#{player_choice}' is not an option, please select available number"
      print_current_board
      process_choice(gets.chomp, player_icon)
    end
  end

  def choice_available?(choice)
    @board.flatten.include?(choice)
  end

  def update_board(player_choice, player_icon)
    row = @board.index { |element| element.include?(player_choice) }
    col = @board[row].index(player_choice)
    @board[row][col] = player_icon
  end
end
