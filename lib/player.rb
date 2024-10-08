# frozen_string_literal: true

# Player information like name, win total
# move choice
class Player
  attr_reader :name, :icon

  def initialize(name, icon, color)
    @name = name.colorize(color.to_sym)
    @icon = icon.colorize(color.to_sym)
    @total_points = 0
  end

  def add_point
    @total_points += 1
  end

  def score
    @total_points
  end
end
