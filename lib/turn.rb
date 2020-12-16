require './lib/menu'
require './lib/player'

class Turn
  attr_reader :menu,
              :computer_player,
              :user_player,
              :board

  def initialize(menu, computer_player, user_player)
    @menu = menu
    # @computer_board = computer_board
    # @user_board = user_board
    # @computer_cruiser = computer_cruiser
    # @computer_submarine = computer_submarine
    # @user_cruiser = user_cruiser
    # @user_submarine = user_submarine
    @board = board
    @computer_player = computer_player
    @user_player = user_player
  end

def display_boards
  # require "pry"; binding.pry
  puts menu.computer_board_header
  puts computer_player.board.render
  puts menu.user_board_header
  puts user_player.board.render(true)
end

def valid_coordinates(player, ship, coordinates)
  coordinates.all? do |coordinate|
    ((player.board.valid_coordinate?(coordinate) == true ) &&
     (player.board.valid_placement?(ship, coordinates) == true) &&
     (coordinates.uniq.count == ship.length))
  end
end

def place_ship(player, ship, coordinates = true)
  if player == computer_player
    player.board.place(ship, coordinates)
  else

    if ship.name == "Submarine"
      puts menu.enter_coords_submarine
    end

      while coordinates = gets.chomp.upcase.split
        if valid_coordinates(player, ship, coordinates) == true
          player.board.place(ship, coordinates)
          puts player.board.render(true)
          break
        else
          puts "Those are invalid coordinates. Please try again:"
        end
      end
    end
end

end
