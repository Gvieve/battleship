require './lib/menu'
require './lib/player'

class Turn
  attr_reader :menu,
              :computer_player,
              :user_player,
              :board,
              :user_player_ship_count,
              :computer_player_ship_count

  def initialize(menu, computer_player, user_player)
    @menu = menu
    @computer_player = computer_player
    @user_player = user_player
    @user_player_ship_count = 0
    @computer_player_ship_count = 0
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
            break ("ship_placed")
          else
            puts menu.invalid_coords
          end
        end
      end
  end

  def display_boards
    # require "pry"; binding.pry
    puts menu.computer_board_header
    puts computer_player.board.render
    puts menu.user_board_header
    puts user_player.board.render(true)
  end

  def user_player_turn(user_player)
    puts "Enter the coordinate for your shot."
    user_turn_input = gets.chomp.upcase
    if computer_player.board.valid_coordinate?(user_turn_input) == true
      computer_player.board.cells[user_turn_input].fire_upon
      if computer_player.board.cells[user_turn_input].render(true) == "M"
        puts "Your shot on #{user_turn_input} was a miss."
      elsif computer_player.board.cells[user_turn_input].render(true) == "H"
        puts "Your shot on #{user_turn_input} was a hit."
      elsif computer_player.board.cells[user_turn_input].render(true) == "X"
        puts "Your shot sunk my #{computer.board.cells[user_turn_input].ship.name}!"
        @computer_player_ship_count += 1
      end
    else
      puts "Please enter a valid coordinate."
    end
  end

  def computer_player_turn(computer_player)
    computer_turn_input = user_player.board.cells.keys.sample
    until user_player.board.valid_coordinate?(computer_turn_input) && user_player.board.cells[computer_turn_input].fired_upon? == false
      computer_turn_input = user_player.board.cells.keys.sample
    end
    user_player.board.cells[computer_turn_input].fire_upon
    if user_player.board.cells[computer_turn_input].render(true) == "M"
      puts "Computer shot on #{computer_turn_input} was a miss."
    elsif user_player.board.cells[computer_turn_input].render(true) == "H"
      puts "Computer shot on #{computer_turn_input} was a hit."
    elsif user_player.board.cells[computer_input].render(true) == "X"
      puts "Computer shot on #{computer_turn_input} sunk your #{user_player.board.cells[computer_input].ship.name}!"
      @user_player_ship_count += 1
    end
  end

end
