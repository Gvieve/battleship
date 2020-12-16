require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/menu'
require './lib/game'
require './lib/player'

class GameTest < Minitest::Test
  def test_it_exists_and_has_attributes
    menu = Menu.new
    computer_player = Player.new(@board)
    user_player = Player.new(@board)
    game = Game.new(menu, computer_player, user_player)

    assert_instance_of Game, game
    assert_equal menu, game.menu
    assert_equal computer_player, game.computer_player
    assert_equal user_player, game.user_player
  end
end
