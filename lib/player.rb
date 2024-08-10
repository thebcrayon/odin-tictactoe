# frozen_string_literal: true

# Player information like name, win total
# move choice
class Player
  attr_reader :name

  def initialize(name)
    @name = name
    @total_points = 0
    @current_choice = 0
  end

  def add_point
    @total_points += 1
  end

  def score
    @total_points
  end
end
