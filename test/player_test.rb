require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'
require './lib/board'
require './lib/cell'
require './lib/ship'

class PlayerTest < Minitest::Test
  def test_it_exists_and_has_attributes
    board = Board.new
    computer_player = Player.new(board)

    assert_instance_of Player, computer_player
    assert_equal board, computer_player.board
  end

  def test_it_has_ships
    board = Board.new
    computer_player = Player.new(board)
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal cruiser, computer_player.cruiser(cruiser)
    assert_equal submarine, computer_player.submarine(submarine)
  end
end
