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
  # verify if we need to change to instance variable.

  SEPARATOR = '-----------------'.freeze

  def initialize
    @result = 'draw'
    @hash = { 1 => 1, 2 => 2, 3 => 3, 4 => 4, 5 => 5, 6 => 6, 7 => 7, 8 => 8, 9 => 9 }
  end

  def who_is_first?(player_one, player_two)
    value = %w[X T]
    select = Random.new.rand(2)
    if select.zero?
      player_one.piece = value[0]
      player_two.piece = value[1]
    else
      player_one.piece = value[1]
      player_two.piece = value[0]
    end
  end

  def match_hash(hash)
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
    if (1..9).include? move
      @hash[move] = player.piece if @hash.value? move
    else
      loop do
        puts 'Write another number between 1 and 9'
        move = gets.chomp.to_i
        if (1..9).include? move
          if @hash.value? move
            @hash[move] = player.piece
            puts "inside if #{player.piece}"
            break
          else
            puts 'before next'
            next
          end
        end
      end
    end
    display_board
  end
end
