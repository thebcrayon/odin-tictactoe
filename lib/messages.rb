# frozen_string_literal: true

# Messages to print to UI
module Messages
  def msg_welcome(players, number_of_rounds)
    puts "Welcome #{players[0].name} and #{players[1].name}. Best out of #{number_of_rounds} wins!"
  end
end
