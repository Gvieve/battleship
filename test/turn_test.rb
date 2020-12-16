require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/menu'
require './lib/player'
require './lib/turn'

class TurnTest < Minitest::Test
  def test_it_exists_and_has_attributes
    turn = Turn.new
    computer_player = Player.new(computer_board)
    # user_board = Board.new
    user_player = Player.new(user_board)

    assert_instance_of Turn, turn
    assert_equal "", turn.computer_board_render
  end
end
