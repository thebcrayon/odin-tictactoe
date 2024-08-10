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

  def print_current_state
    @board.each_with_index do |row, _row_index|
      puts row.join(' | ')
    end
  end
end
