class Player
  attr_reader :board,
              :cruiser,
              :submarine

  def initialize(board)
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end
end
