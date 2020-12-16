class Game
  attr_reader :menu,
              :computer_player,
              :user_player

  def initialize(menu, computer_player, user_player)
    @menu = menu
    @computer_player = computer_player
    @user_player = user_player
  end

  def start
    puts menu.welcome_menu

    while user_play_input = gets.chomp.downcase
      if user_play_input == "p"
        puts self.player_board_message
        #play_game
        break
      elsif user_play_input == 'q'
        puts menu.quit_game
        break
      else
        puts menu.play_game_invalid_input
      end
    end
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

# Maybe use to validate when all ships are sunk
  # def all_ships_are_not_placed(player)
  #   cells_with_ships = []
  #   player.board.cells.find_all do |coord, cell|
  #     # require "pry"; binding.pry
  #     if !cell.ship.nil?
  #       cells_with_ships << cell
  #     end
  #   end
  #   # require "pry"; binding.pry
  #   cells_with_ships.count == 5
  # end

  def player_board_message
    puts menu.computer_ship_placed
    puts menu.lay_out
    puts menu.ship_units
    puts user_player.board.render
    puts menu.enter_coords_cruiser
  end
end
