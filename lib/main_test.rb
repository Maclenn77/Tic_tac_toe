require_relative 'classes'
puts 'Welcome'

match = Match.new
puts 'players name'
name = 'Bob'
first = Player.new(name)

puts 'second players name'
name = 'Jerry'
second = Player.new(name)

puts "#{first.name} , #{second.name}"

match.restart_match(first, second)
