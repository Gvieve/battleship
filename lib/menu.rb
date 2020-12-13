class Menu
  attr_reader :welcome,
              :play,
              :board

  def initialize
    @welcome  = "Welcome to BATTLESHIP"
    @play     = "Enter p to play. Enter q to quit."
    @board    = Board.new
  end

  def computer_ship_placed
    "I have laid out my ships on the grid."
  end

  def lay_out
    "You now need to lay out your two ships."
  end

  def ship_units
    "The Cruiser is three units long and the Submarine is two units long."
  end

  def render
    board.render
  end

  def enter_coords
    "Enter the squares for the Cruiser (3 spaces):"
  end

  def gets_coords
    coords = gets.chomp
    coords.split(" ")
  end
end
