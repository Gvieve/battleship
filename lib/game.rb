class Game
  attr_reader :menu,
              :computer_player,
              :user_player

  def initialize(turn, computer_player, user_player)
    # @menu = menu
    @turn = turn
    @computer_player = computer_player
    @user_player = user_player
  end

  def start
    puts @turn.menu.welcome_menu
require "pry"; binding.pry
    while user_play_input = gets.chomp.downcase
      if user_play_input == "p"
        puts self.player_board_message
        #play_game
        break
      elsif user_play_input == 'q'
        puts @turn.menu.quit_game
        break
      else
        puts @turn.menu.play_game_invalid_input
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
    puts @turn.menu.computer_ship_placed
    puts @turn.menu.lay_out
    puts @turn.menu.ship_units
    puts user_player.board.render
    puts @turn.menu.enter_coords_cruiser
  end
end
