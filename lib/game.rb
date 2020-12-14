class Game
  attr_reader :menu,
              :board

  def initialize(menu, board)
    @menu = menu
    @board = board
  end

  def start
    # require "pry"; binding.pry
    puts menu.welcome
    puts menu.play

    user_play_input = gets.chomp.downcase

    if user_play_input == "p"
      # self.play_game
    elsif user_play_input == 'q'
      puts "Ok, goodbye."
    else
      puts "I'm sorry I dont understand."
    end
  end

  # def play_game
  #
  # end

  def computer_place_ship(ship, coordinates)
    board.place(ship, coordinates)
    # require "pry"; binding.pry
  end

  def player_board_message
    puts menu.computer_ship_placed
    puts menu.lay_out
    puts menu.ship_units
    puts board.render
  end
end
