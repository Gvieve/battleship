class Game
  attr_reader :menu,
              :computer_player,
              :user_player

  def initialize(turn, computer_player, user_player)
    @turn = turn
    @computer_player = computer_player
    @user_player = user_player
  end

  def start
    puts @turn.menu.welcome_menu

    while user_play_input = gets.chomp.downcase
      if user_play_input == "p"
        puts self.player_board_message
        self.place_user_ships
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

  def player_board_message
    puts @turn.menu.computer_ship_placed
    puts @turn.menu.lay_out
    puts @turn.menu.ship_units
    puts user_player.board.render
    puts @turn.menu.enter_coords_cruiser
  end

  def place_user_ships
    @turn.place_ship(user_player, user_player.cruiser)
    @turn.place_ship(user_player, user_player.submarine)
  end

  def play_game
    # we need to create a loop to run through display_boards,
    # computer_player_turn and user_player_turn until someone loses

  end

  def game_over
    # @turn.user_player_ship_count == 2
    # need to write logic for this, ship_count goes up when ship is sunk
    # for either user
  end
end
