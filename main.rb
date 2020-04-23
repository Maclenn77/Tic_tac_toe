puts 'Welcome to the game!'
puts 'This game is designed for two players'
puts 'Player one, what\'s your name?'
name_one = gets.chomp
puts "#{name_one} welcome aboard!"
puts 'Player two, what\'s your name?'
name_two = gets.chomp
puts "#{name_two} welcome aboard!"
puts "#{name_one} would be the X and will make the first move"
puts "#{name_two} would be the O and will make the second move"
row = ['     |     |     ']
puts row
puts separator = '-----------------'
puts row
puts separator
puts row
puts 'Let\'s start!'
puts "#{name_one} it's your turn"
