require 'pry-byebug'

winner = false
i = 0

until winner
  winner = true if i == 8
  puts i
  i += 1
end
