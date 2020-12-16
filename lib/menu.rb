class Menu
  attr_reader :welcome,
              :play,
              :board

  def welcome_menu
    "Welcome to BATTLESHIP\nEnter p to play. Enter q to quit."
  end

  def quit_game
    "Ok, goodbye."
  end

  def play_game_invalid_input
    "I'm sorry I dont understand. Please enter p to play or q to quit:"
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

  def user_shot
    "Enter the coordinate for your shot:"
  end

  def user_shot_invalid
    "Please enter a valid coordinate:"
  end

  def user_won
    "You won!"
  end

  def computer_won
    "I won!"
  end
end
