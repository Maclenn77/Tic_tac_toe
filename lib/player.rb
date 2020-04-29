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
