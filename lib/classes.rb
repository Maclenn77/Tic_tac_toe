class Player
  attr_reader :name
  attr_accessor :piece
  def initialize(name, piece = ' ', score = 0)
    @name = name
    @score = score
    @piece = piece
  end
end

class Match
  SEPARATOR = '-----------------'.freeze

  def initialize
    @result = 'draw'
    @hash = { 1 => 1, 2 => 2, 3 => 3, 4 => 4, 5 => 5, 6 => 6, 7 => 7, 8 => 8, 9 => 9 }
    @turn = 0
  end

  def who_is_first?(player_one, player_two)
    value = %w[X O]
    select = Random.new.rand(2)
    if select.zero?
      player_one.piece = value[0]
      player_two.piece = value[1]
    else
      player_one.piece = value[1]
      player_two.piece = value[0]
    end
  end

  # Why adding variables here displays the changes, but adding in the initialize method, doesn't work
  def display_board
    puts @row_one = [" #{@hash[1]} | #{@hash[2]} | #{@hash[3]} "]
    puts SEPARATOR
    puts @row_two = [" #{@hash[4]} | #{@hash[5]} | #{@hash[6]} "]
    puts SEPARATOR
    puts @row_three = [" #{@hash[7]} | #{@hash[8]} | #{@hash[9]} "]
  end

  def place_move(move, player)
    until ((1..9).include? move) && (@hash.value? move)
      puts 'Write another number between 1 and 9'
      move = gets.chomp.to_i
    end

    @hash[move] = player.piece
    display_board
    puts "#{player.name} it's your turn"
  end

  def next_turn(player_one, player_two, move)
    if (@turn += 1).odd?
      place_move(move, player_one) if player_one.piece == 'X'
      place_move(move, player_two) if player_two.piece == 'X'
    else
      place_move(move, player_one) if player_one.piece == 'O'
      place_move(move, player_two) if player_two.piece == 'O'
    end
  end

  def check_winner(player)
    winner = false
    winner_cases.each { |cases| winner = true if cases.all? == player.piece }
    winner
  end

  # players = {'0' => Player_1, 'X' => Player_2}
  # def next_turn(match)
  #   if match.turn.even?
  #     plays Playwe whiche Player.piece == 'X'
  # else plays player which player.piece == 0
  # end
end
