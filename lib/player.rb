class Player
  attr_reader :board
  def initialize(board)
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def cruiser(ship)
    ship
  end

  def submarine(ship)
    ship
  end
end
