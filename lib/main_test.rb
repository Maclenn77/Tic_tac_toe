require_relative 'classes'
puts_hash = {
  'draw' => -> { puts 'It\'s a draw' },
  'play_again' => -> { puts 'Would you like to play a new match? Write \'yes\' to continue or \'no\' to exit.' },
  'first_move' => proc { |first| puts "#{first} is going to start.\n #{first}, start playing!"},
}

match = Match.new
puts "Welcome to the game! \n Player one, what\'s your name?"
name_one = gets.chomp
first = Player.new(name_one)
puts "#{name_one}, welcome aboard!"

puts 'Player two, what\'s your name?'
name_two = gets.chomp
second = Player.new(name_two)
puts "#{name_two}, welcome aboard!"

# puts "#{name_one} would be the X and will make the first move"
# puts "#{name_two} would be the O and will make the second move"
# puts "This is the board of the game, \n
# each square has an number index and it starts at 1 and ends at 9. \n
# Please write the index number to tell me where are you going to place your move."
# puts "Let\'s start! \n"

match.restart_match(first, second, puts_hash)
