require './lib/turn'
require './lib/player'
require './lib/runner_restart'

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
        self.play_game
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
    loop do
      @turn.display_boards
      @turn.user_player_turn(user_player)
      @turn.computer_player_turn(computer_player)
      if @turn.computer_player_ship_count == 2
        puts @turn.menu.computer_won
        restart = RunnerRestart.new
        restart.restart
        break
      elsif @turn.user_player_ship_count == 2
        puts @turn.menu.user_won
        restart = RunnerRestart.new
        restart.restart
        break
      else
        next
      end
    end
  end
end
