class Menu
  attr_reader :welcome,
              :play

  def initialize
    @welcome  = "Welcome to BATTLESHIP"
    @play     = "Enter p to play. Enter q to quit."
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
end
