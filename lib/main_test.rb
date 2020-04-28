require_relative 'classes'
puts_hash = {
  'draw' => -> { puts 'It\'s a draw' },
  'play_again' => -> { puts 'Would you like to play a new match? Write \'yes\' to continue or \'no\' to exit.' },
  'exit_match' => -> { puts 'See you later!' },
  'valid_op' => -> { puts 'Please write a valid option.' },
  'first_move' => proc { |first| puts "#{first} is going to start.\n #{first}, start playing!" },
  'another_num' => -> { puts 'Write a number between 1 and 9 or \'exit\' to leave.' },
  'your_turn' => ->(player) { puts "#{player} it's your turn" },
  'you_won' => ->(player) { puts "#{player}, you won!" },
  'yes_play' => -> { puts "Let's play again!" }
}

board_hash = {
  'row_one' => ->(hash) { puts [" #{hash[1]} | #{hash[2]} | #{hash[3]} "] },
  'row_two' => ->(hash) { puts [" #{hash[4]} | #{hash[5]} | #{hash[6]} "] },
  'row_three' => ->(hash) { puts [" #{hash[7]} | #{hash[8]} | #{hash[9]} "] },
  'separator' => ->(separator) { puts separator.to_s }
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

match.restart_match(first, second, puts_hash, board_hash)
