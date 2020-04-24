require_relative 'classes'
puts 'Welcome'

puts 'players name'
name = 'hello'
first = Player.new(name)

puts 'second players name'
name = 'bye'
second = Player.new(name)

puts "#{first.name} , #{second.name}"
b = Match.new
b.who_is_first?(first, second)
puts "#{first.piece} , #{second.piece}"
b.display_board
puts 'first player moves'
move = gets.chomp.to_i
b.place_move(move)
