# frozen_string_literal: true

# Group of methods for displaying messages
# in program. Separating to unclutter
# TicTacToe class
module Messages
  def msg_print_board
    @ui.print_current_board
  end

  def msg_prompt_choice
    @current_choice = gets.chomp
  end

  def msg_next_round
    puts "\nReady for the next round? Press ENTER to continue"
    gets.chomp
  end

  def msg_finish_game
    puts "\nGame Over! Final Score:"
    msg_score
    puts 'Press ENTER to exit program'
    gets.chomp
  end

  def msg_welcome
    puts "Welcome #{@player_one.name}(x's) and #{@player_two.name}(o's). Best out of #{@number_of_rounds} wins!"
    puts "\n"
    msg_score unless @round_winner
  end

  def msg_next_player
    puts "\nPlayer turn: #{@current_player.name}"
    puts "Select the Number where you want to move: \n"
    puts "\n"
  end

  def msg_winner
    msg_welcome
    puts "#{@current_player.name} wins this round!"
    puts "\n"
  end

  def msg_score
    print 'Curent Score: '
    print "#{@player_one.name}: #{@player_one.score} | "
    print "#{@player_two.name}: #{@player_two.score} | "
    print "Ties: #{@ties}\n"
  end

  def msg_tie
    puts 'That round ended in a tie. Press ENTER to continue'
    gets.chomp
  end
end
