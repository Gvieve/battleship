class Menu
  attr_reader :welcome,
              :play,
              :board

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

  # def render(show_ship = false)
  #   board.render(show_ship)
  # end

  def computer_board_header
    "=============COMPUTER BOARD============="
  end

  def user_board_header
    "==============PLAYER BOARD=============="
  end

  def enter_coords_cruiser
    "Enter the squares for the Cruiser (3 spaces):"
  end

  def enter_coords_submarine
    "Enter the squares for the Submarine (2 spaces):"
  end

  def invalid_coords
    "Those are invalid coordinates. Please try again:"
  end

  def gets_ship_coords
    ship_coords = gets.chomp
    ship_coords.split(" ")
  end

  def user_shot
    "Enter the coordinate for your shot:"
  end

  def gets_shot_coords
    shot_coords = gets.chomp
  end

  def user_shot_invalid
    "Please enter a valid coordinate:"
  end

  def user_shot_result_miss
    "Your shot on #{} was a miss."
  end

  def computer_shot_result_miss
    "My shot on #{} was a miss."
  end

  def user_shot_result_hit
    "Your shot on #{} was a hit."
  end

  def computer_shot_result_hit
    "My shot on #{} was a hit."
  end

  def user_shot_result_sunk
    "Your shot on #{} sunk a ship."
  end

  def computer_shot_result_sunk
    "My shot on #{} sunk a ship."
  end

  def user_won
    "You won!"
  end

  def computer_won
    "I won!"
  end
end
