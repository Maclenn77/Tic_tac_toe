class Player
  attr_reader :name
  attr_accessor :piece
  def initialize(name, score = 0)
    @name = name
    @score = score
  end
end



class Match
  @@row = ['     |     |     ']
  @@separator = '-----------------'

  def initialize()
    @result = "draw"
    @array = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  end

  def who_is_first?()
    value = {0 => 'X', 1 => 'O'}
    select = Random.new.rand(2)
    puts value[select]
  end

  def match_array(array)
  end

  def display_board
    puts row
    puts separator
    puts row
    puts separator
    puts row
  end
end
