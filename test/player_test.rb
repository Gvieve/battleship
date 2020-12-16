require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'
require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/menu'

class PlayerTest < Minitest::Test
  def test_it_exists_and_has_attributes
    user_player = Player.new
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)

    assert_instance_of Player, user_player
    assert_instance_of Board, user_player.board
    assert_instance_of Ship, user_player.cruiser
    assert_instance_of Ship, user_player.submarine
  end
end
