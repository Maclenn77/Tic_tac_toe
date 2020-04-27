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
match_name.who_is_first?(first, second)
puts "#{first.piece} , #{second.piece}"
match_name.display_board

puts 'first player moves'
move = gets.chomp.to_i
match_name.next_turn(move, first, second)
