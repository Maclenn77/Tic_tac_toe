require_relative 'classes'
puts 'Welcome'

puts 'players name'
name = gets.chomp
first = Player.new(name)

puts 'second players name'
name = gets.chomp
second = Player.new(name)

puts "#{first.name} , #{second.name}"
Match.new.who_is_first?
