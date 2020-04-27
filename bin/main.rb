hash = { 1 => 1, 2 => 2, 3 => 3, 4 => 4, 5 => 5, 6 => 6, 7 => 7, 8 => 8, 9 => 9 }
SEPARATOR = '-----------'.freeze

def display_board(hash)
  puts row_one = [" #{hash[1]} | #{hash[2]} | #{hash[3]} "]
  puts SEPARATOR
  puts row_two = [" #{hash[4]} | #{hash[5]} | #{hash[6]} "]
  puts SEPARATOR
  puts row_three = [" #{hash[7]} | #{hash[8]} | #{hash[9]} "]
end

def place_move(move, player_one, player_two)
  until ((1..9).include? move) && (@hash.value? move)
    puts 'Write another number between 1 and 9'
    move = gets.chomp.to_i
  end

  @hash[move] = player_one.piece
  display_board
  puts "#{player_two.name} it's your turn"
end

puts "Welcome to the game! \n Player one, what\'s your name?"
name_one = gets.chomp
puts "#{name_one} welcome aboard!"

puts 'Player two, what\'s your name?'
name_two = gets.chomp
puts "#{name_two} welcome aboard!"

puts "#{name_one} would be the X and will make the first move"
puts "#{name_two} would be the O and will make the second move"
puts "This is the board of the game, \n
each square has an number index and it starts at 1 and ends at 9. \n
Please write the index number to tell me where are you going to place your move."
display_board(hash)

puts 'Let\'s start!'
puts "#{name_one} it's your turn \n
Choose one number between 1 and 9."
display_board(hash)

puts "#{name_two} it's your turn \n
Choose one number between 1 and 9."
display_board(hash)

# If there's an invalid movement
puts "That's value is invalid. Choose between 1-9"
puts "That's value is invalid. Write a number"

# If one player moves in an occuped space
puts "Oh! You can't move there. #{name_one} already played there."
puts 'Try a different place.'
puts "Oh! You can't move there. #{name_two} already played there."
puts 'Try a different place.'

# Final cases
puts "#{name_one},  you won!"
puts "#{name_two}, you won!"
puts "It's a draw! Nobody won."

puts 'This is the score'
puts "#{name_one}: games_won"
puts "#{name_two}: games_won"

puts 'Do you want to play another game?'
puts 'Select (y)es or (n)o'
other_game = gets.chomp

puts "You answer #{other_game}. Let's play again!"

puts 'See you later!'
