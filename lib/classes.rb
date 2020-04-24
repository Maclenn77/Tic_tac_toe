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
  @@row = ['     |     |     ']
  SEPARATOR = '-----------------'.freeze

  def initialize
    @result = 'draw'
    @array = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
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

  def match_array(array)
  end

  def display_board
    puts @row_one = [" #{@array[0][0]} | #{@array[0][1]} | #{@array[0][2]} "]
    puts SEPARATOR
    puts @row_two = [" #{@array[1][0]} | #{@array[1][1]} | #{@array[1][2]} "]
    puts SEPARATOR
    puts @row_three = [" #{@array[2][0]} | #{@array[2][1]} | #{@array[2][2]} "]
  end

  def place_move
    @array[0][0] = 'hi'
    display_board
  end

=begin
  def verify_move(move)
    if move.is_a? Integer
      if (1..9).include? move
        display_board
      end
    else
      
    end
  end
=end
end