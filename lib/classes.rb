class Player
  attr_accessor :name, :piece, :score

  def initialize(name, piece = ' ', score = 0)
    @name = name
    @score = score
    @piece = piece
  end

  def valid_name(name)
    name.length.positive?
  end

  def write_name
    'Write another name'
  end

  def change_score
    @score += 1
  end
end

class Match
  attr_accessor :hash, :result
  attr_reader :turn

  def initialize(matches = 0)
    @hash = { 1 => 1, 2 => 2, 3 => 3, 4 => 4, 5 => 5, 6 => 6, 7 => 7, 8 => 8, 9 => 9 }
    @turn = 0
    @matches = matches
    @result = ''
  end

  def who_is_first?(player_one, player_two)
    value = %w[X O]
    select = Random.new.rand(2)
    if select.zero?
      player_one.piece = value[0]
      player_two.piece = value[1]
      player_one
    else
      player_one.piece = value[1]
      player_two.piece = value[0]
      player_two
    end
  end

  def display_board(board_hash)
    board_hash['row_one'].call(@hash)
    board_hash['separator'].call(SEPARATOR)
    board_hash['row_two'].call(@hash)
    board_hash['separator'].call(SEPARATOR)
    board_hash['row_three'].call(@hash)
  end

  def next_turn(*args)
    player_turn = args[0..1].detect { |a| a.piece == 'X' } if @turn.odd?
    player_turn = args[0..1].detect { |a| a.piece == 'O' } if @turn.even?
    player_turn
  end

  def add_turn
    @turn += 1
  end

  def place_move(move, player_one)
    @hash[move] = player_one.piece
  end

  def check_winner(player_turn)
    winner = false
    winner_cases = [[@hash[1], @hash[2], @hash[3]], [@hash[1], @hash[4], @hash[7]],
                    [@hash[1], @hash[5], @hash[9]], [@hash[2], @hash[5], @hash[8]],
                    [@hash[3], @hash[6], @hash[9]], [@hash[3], @hash[5], @hash[7]],
                    [@hash[4], @hash[5], @hash[6]], [@hash[7], @hash[8], @hash[9]]]
    winner_cases.each { |cases| winner = true if cases.all?(player_turn.piece) }
    winner
  end

  # def keep_playing?(player_one, player_two, puts_hash, board_hash)
  #   condition = false
  #   puts_hash['play_again'].call
  #   choice = gets.chomp
  #   until condition
  #     if choice == 'y'
  #       condition = true
  #       restart_match(player_one, player_two, puts_hash, board_hash)
  #     elsif choice == 'n'
  #       puts_hash['exit_match'].call
  #       total_score(player_one, player_two)
  #       exit
  #     else
  #       puts_hash['valid_op'].call
  #       choice = gets.chomp
  #     end
  #   end
  # end

  def total_score(player_one, player_two, matches)
    score = "Total matches: #{matches} Total Score:\n
          #{player_one.name}: #{player_one.score}\n
          #{player_two.name}: #{player_two.score}"
    score
  end

  def restart_match(player_one, player_two, puts_hash, board_hash)
    if @matches.positive?
      total_score(player_one, player_two, @matches)
      puts_hash['yes_play'].call
    end
    matches = @matches + 1
    match = Match.new(matches)
    first = match.who_is_first?(player_one, player_two)
    puts_hash['first_move'].call(first)
    match.display_board(board_hash)
    match.next_turn(player_one, player_two, puts_hash, board_hash)
  end
end
