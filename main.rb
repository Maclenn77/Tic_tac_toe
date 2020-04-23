puts 'Welcome to the game!'
puts 'This game is designed for two players'
puts 'Player one, what\'s your name?'
name_one = gets.chomp
puts "#{name_one} welcome aboard!"

puts 'Player two, what\'s your name?'
name_two = gets.chomp
puts "#{name_two} welcome aboard!"

# Select firts move randomly
puts "Now, I'll choose who will start."

puts "#{name_one} would be the X and will make the first move"
puts "#{name_two} would be the O and will make the second move"
puts 'This is the board of the game'
row = ['     |     |     ']
puts row
puts separator = '-----------------'
puts row
puts separator
puts row

# It's going to be a maximum of nine movements for the game.
# We decided to add just  two movements for representation.
puts 'Let\'s start!'
puts "#{name_one} it's your turn"
puts 'Choose one number. Each number represents a square'
puts row
puts separator = '-----------------'
puts row
puts separator
puts row

puts "#{name_two} it's your turn"
puts 'Choose one number. Each number represents a square'
puts row
puts separator = '-----------------'
puts row
puts separator
puts row

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
