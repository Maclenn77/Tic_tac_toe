class Player
  attr_reader :name
  attr_accessor :piece
  attr_accessor :score
  def initialize(name, piece = ' ', score = 0)
    @name = name
    @score = score
    @piece = piece
  end

  def change_score
    @score += 1
  end
end

class Match
  SEPARATOR = '------------'.freeze
  @@matches = -1

  def initialize
    @hash = { 1 => 1, 2 => 2, 3 => 3, 4 => 4, 5 => 5, 6 => 6, 7 => 7, 8 => 8, 9 => 9 }
    @turn = 0
    @@matches += 1
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

  def display_board(board_hash)
    board_hash['row_one'].call(@hash)
    board_hash['separator'].call(SEPARATOR)
    board_hash['row_two'].call(@hash)
    board_hash['separator'].call(SEPARATOR)
    board_hash['row_three'].call(@hash)
  end

  def place_move(player_one, puts_hash, board_hash)
    move = 0
    until ((1..9).include? move) && (@hash.value? move)
      puts_hash['another_num'].call
      move = gets.chomp
      exit if move == 'exit'
      move = move.to_i
    end
    @hash[move] = player_one.piece
    display_board(board_hash)
  end

  def next_turn(*args, puts_hash, board_hash)
    @turn = 0
    while @turn < 9
      @turn += 1
      if @turn.odd?
        player_turn = args[0..-1].detect { |a| a.piece == 'X' }
        player_next = args[0..-1].detect { |a| a.piece == 'O' }
      else
        player_turn = args[0..-1].detect { |a| a.piece == 'O' }
        player_next = args[0..-1].detect { |a| a.piece == 'X' }
      end
      place_move(player_turn, puts_hash, board_hash)
      check_winner(player_turn, player_next, puts_hash, board_hash) if @turn >= 5
      puts_hash['your_turn'].call(player_next.name) if @turn < 9
    end
    puts_hash['draw'].call
    keep_playing?(player_turn, player_next, puts_hash, board_hash)
  end

  def check_winner(player_turn, player_next, puts_hash, board_hash)
    winner = false
    winner_cases = [[@hash[1], @hash[2], @hash[3]], [@hash[1], @hash[4], @hash[7]],
                    [@hash[1], @hash[5], @hash[9]], [@hash[2], @hash[5], @hash[8]],
                    [@hash[3], @hash[6], @hash[9]], [@hash[3], @hash[5], @hash[7]],
                    [@hash[4], @hash[5], @hash[6]], [@hash[7], @hash[8], @hash[9]]]
    winner_cases.each { |cases| winner = true if cases.all?(player_turn.piece) }
    if winner
      puts_hash['you_won'].call(player_turn.name)
      player_turn.change_score
      keep_playing?(player_turn, player_next, puts_hash, board_hash)
    end
    winner
  end

  def keep_playing?(player_one, player_two, puts_hash, board_hash)
    condition = false
    puts_hash['play_again'].call
    choice = gets.chomp
    until condition
      if /yes|YES|Yes/ =~ choice
        condition = true
        restart_match(player_one, player_two, puts_hash, board_hash)
      elsif /no|NO|No/ =~ choice
        puts_hash['exit_match'].call
        total_score(player_one, player_two)
        exit
      else
        puts_hash['valid_op']
        choice = gets.chomp
      end
    end
  end

  def total_score(player_one, player_two)
    puts "Total matches: #{@@matches} Total Score:\n
          #{player_one.name}: #{player_one.score}\n
          #{player_two.name}: #{player_two.score}"
  end

  def restart_match(player_one, player_two, puts_hash, board_hash)
    if @@matches.positive?
      total_score(player_one, player_two)
      puts_hash['yes_play'].call
    end
    match = Match.new
    first = match.who_is_first?(player_one, player_two)
    puts_hash['first_move'].call(first)
    match.display_board(board_hash)
    match.next_turn(player_one, player_two, puts_hash, board_hash)
  end
end
