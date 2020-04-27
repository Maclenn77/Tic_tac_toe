class Player
  attr_reader :name
  attr_accessor :piece
  def initialize(name, piece = ' ', score = 0)
    @name = name
    @score = score
    @piece = piece
  end

  def score
    
  end
end

class Match
  SEPARATOR = '-----------------'.freeze

  def initialize
    @result = 'draw'
    @hash = { 1 => 1, 2 => 2, 3 => 3, 4 => 4, 5 => 5, 6 => 6, 7 => 7, 8 => 8, 9 => 9 }
    @turn = 0
    @row_one = []
    @row_two = []
    @row_three = []
  end

  def who_is_first?(player_one, player_two)
    value = %w[X O]
    select = Random.new.rand(2)
    if select.zero?
      player_one.piece = value[0]
      player_two.piece = value[1]
      player_one.name
    else
      player_one.piece = value[1]
      player_two.piece = value[0]
      player_two.name
    end
  end

  def display_board
    puts @row_one = [" #{@hash[1]} | #{@hash[2]} | #{@hash[3]} "]
    puts SEPARATOR
    puts @row_two = [" #{@hash[4]} | #{@hash[5]} | #{@hash[6]} "]
    puts SEPARATOR
    puts @row_three = [" #{@hash[7]} | #{@hash[8]} | #{@hash[9]} "]
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

  def next_turn(*args)
    @turn = 0
    while @turn < 9
      @turn += 1
      if @turn.odd?
        player_turn = args[1..-1].detect { |a| a.piece == 'X' }
        player_next = args[1..-1].detect { |a| a.piece == 'O' }
      else
        player_turn = args[1..-1].detect { |a| a.piece == 'O' }
        player_next = args[1..-1].detect { |a| a.piece == 'X' }
      end
      puts "value turn #{@turn}"
      place_move(args[0], player_turn, player_next)
      check_winner(player_turn, player_next) if @turn >= 5
      # keep_playing? if check_winner(player_turn)
    end
    puts 'It\'s a draw'
    keep_playing?(player_turn, player_next)
  end

  def check_winner(player_turn, player_next)
    winner = false
    winner_cases = [[@hash[1], @hash[2], @hash[3]], [@hash[1], @hash[4], @hash[7]],
                    [@hash[1], @hash[5], @hash[9]], [@hash[2], @hash[5], @hash[8]],
                    [@hash[3], @hash[6], @hash[9]], [@hash[3], @hash[5], @hash[7]],
                    [@hash[4], @hash[5], @hash[6]], [@hash[7], @hash[8], @hash[9]]]
    winner_cases.each { |cases| winner = true if cases.all?(player_turn.piece) }
    if winner
      puts "#{player_turn.name}, you won"
      keep_playing?(player_turn, player_next)
    end
    winner
  end

  def keep_playing?(player_one, player_two)
    condition = false
    puts 'Would you like to play a new match? Write \'yes\' to continue or \'no\' to exit.'
    choice = gets.chomp
    until condition
      if /yes|YES|Yes/ =~ choice
        condition = true
        restart_match(player_one, player_two)
      elsif /no|NO|No/ =~ choice
        puts 'See you later!'
        exit
      else
        puts 'Please write a valid option.'
        choice = gets.chomp
      end
    end
  end

  def restart_match(player_one, player_two)
    puts "Let's play again!"
    match = Match.new
    x = match.who_is_first?(player_one, player_two)
    puts "#{x} is going to start"
    puts "#{x} make your move"
    match.display_board
    move = gets.chomp.to_i
    match.next_turn(move, player_one, player_two)
  end
end
