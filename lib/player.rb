# frozen_string_literal: true

# Class Definition: Player class holds state
# Player Name
class Player
  attr_reader :name, :icon

  def initialize(name:, icon:)
    @name = name
    @icon = icon
  end
end
