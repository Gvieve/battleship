require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/menu'

class MenuTest < Minitest::Test
  def test_it_exists_and_has_attributes
    menu = Menu.new

    assert_instance_of Menu, menu
    assert_equal "Welcome to BATTLESHIP", menu.welcome
    assert_equal "Enter p to play. Enter q to quit.", menu.play
  end

  def test_computer_responds
    menu = Menu.new

    assert_equal "I have laid out my ships on the grid.", menu.computer_ship_placed
    assert_equal "You now need to lay out your two ships.", menu.lay_out
    assert_equal "The Cruiser is three units long and the Submarine is two units long.", menu.ship_units
  end

  def test_render_board_shows
    menu = Menu.new
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    expected = "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n"

    assert_equal expected, menu.render
    assert_equal "Enter the squares for the Cruiser (3 spaces):", menu.enter_coords
    # assert_equal [], menu.gets_coords
  end
end
