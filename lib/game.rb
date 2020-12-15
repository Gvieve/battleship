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
    puts menu.welcome
    puts menu.play

    user_play_input = gets.chomp.downcase

    if user_play_input == "p"
    elsif user_play_input == 'q'
      puts "Ok, goodbye."
    else
      puts "I'm sorry I dont understand."
    end
  end

  def valid_coordinates(player, ship, coordinates)
    coordinates.all? do |coordinate|
      ((player.board.valid_coordinate?(coordinate) == true )&&
       (player.board.valid_placement?(ship, coordinates) == true) &&
       (coordinates.uniq == 3))
    end
  end

  def place_ship(player, ship, coordinates = true)
    if player == computer_player
      player.board.place(ship, coordinates)
    else
      while
      player_coordinates = gets.chomp
      coordinates = player_coordinates.split
        valid_coordinates(player, ship, coordinates) == false
        puts "Those are invalid coordinates. Please try again:"
      end
        player.board.place(ship, coordinates)
    end
  end

  def player_board_message
    puts menu.computer_ship_placed
    puts menu.lay_out
    puts menu.ship_units
    puts user_player.board.render
    puts menu.enter_coords_cruiser
  end
end
