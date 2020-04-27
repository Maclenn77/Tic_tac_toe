require_relative 'classes'
puts 'Welcome'

def game(first, second)
    match = Match.new
    x = match.who_is_first?(first, second)
    puts "#{x} is going to start"
    # puts "#{first.piece} , #{second.piece}"

    puts "#{x} make your move"
    match.display_board
    move = gets.chomp.to_i
    match.next_turn(move, first, second)
    game(first, second)
end

puts 'players name'
name = 'Bob'
first = Player.new(name)

puts 'second players name'
name = 'Jerry'
second = Player.new(name)

puts "#{first.name} , #{second.name}"

game(first, second)
