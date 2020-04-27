require_relative 'classes'
puts 'Welcome'

puts 'players name'
name = 'Bob'
first = Player.new(name)

puts 'second players name'
name = 'Jerry'
second = Player.new(name)

puts "#{first.name} , #{second.name}"
match_name = Match.new
x = match_name.who_is_first?(first, second)
puts "#{x} is going to start"
# puts "#{first.piece} , #{second.piece}"

puts "#{x} make your move"
match_name.display_board
move = gets.chomp.to_i
match_name.next_turn(move, first, second)
