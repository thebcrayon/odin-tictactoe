# frozen_string_literal: true

# Class Definition: Board for TicTacToe
class Board
  attr_reader :board

  def initialize
    @board = Array.new(9)
  end

  def place_icon(index, player_icon)
    @board[index] = player_icon
  end

  def cell_available?(index)
    board[index].nil?
  end

  def winning_pattern?
    horizontals? || verticals? || diagonals?
  end

  def full?
    board.none?(&:nil?)
  end

  def display
    rows_array = board.each_slice(3).to_a
    rows_array.each_with_index do |row, i|
      puts format_row(row, i).join(' | ')
      puts '---------' unless i == 2
    end
    puts
  end

  private

  def format_row(row, idx)
    row.map.with_index do |cell, j|
      offset = ((idx * 3) + j) + 1
      cell.nil? ? offset : cell
    end
  end

  def horizontals?
    [ # is at least one horizontal all the same icon
      board.fetch_values(0, 1, 2),
      board.fetch_values(3, 4, 5),
      board.fetch_values(6, 7, 8)
    ].any? do |horizontal|
      unique_values = horizontal.uniq
      unique_values.size == 1 && !unique_values[0].nil?
    end
  end

  def verticals?
    [ # is at least one vertical all the same icon
      board.fetch_values(0, 3, 6),
      board.fetch_values(1, 4, 7),
      board.fetch_values(2, 5, 8)
    ].any? do |vertical|
      unique_values = vertical.uniq
      unique_values.size == 1 && !unique_values[0].nil?
    end
  end

  def diagonals?
    [ # is at least one diagonal all the same icon
      board.fetch_values(0, 4, 8),
      board.fetch_values(2, 4, 6)
    ].any? do |diagonal|
      unique_values = diagonal.uniq
      unique_values.size == 1 && !unique_values[0].nil?
    end
  end
end
