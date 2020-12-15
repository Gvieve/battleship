class Player
  attr_reader :board
  def initialize(board)
    @board = board
  end

  def cruiser(ship)
    ship
  end

  def submarine(ship)
    ship
  end
end
