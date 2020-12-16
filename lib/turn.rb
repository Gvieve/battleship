require './lib/menu'

class Turn
  attr_reader :computer_player,
              :user_player

  def initialize
    @menu = Menu.new
    @computer_player = computer_player
    @user_player = user_player
  end

def computer_board_render
  require "pry"; binding.pry
  puts @menu.computer_board_header


end

end
