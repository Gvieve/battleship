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

    expected = "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n"
    assert_equal expected, menu.render
    assert_equal "Enter the squares for the #{} (_ spaces):", menu.enter_coords_ship1
    expected2 = "=============COMPUTER BOARD============="
    expected3 = "==============PLAYER BOARD=============="
    assert_equal expected2, menu.computer_board_header
    assert_equal expected3, menu.user_board_header
    # test we can show_ship with menu.render in game class
    # expected2 = "  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n"
    # assert_equal expected2, menu.render(true)
  end

  def test_user_inputs_invalid_coords_response
    menu = Menu.new
    board = Board.new

    assert_equal "Enter the squares for the #{} (_ spaces):", menu.enter_coords_ship2
    assert_equal "Those are invalid coordinates. Please try again:", menu.invalid_coords
  end

  def test_user_shot
    menu = Menu.new
    board = Board.new

    assert_equal "Enter the coordinate for your shot:", menu.user_shot
    assert_equal "Please enter a valid coordinate:", menu.user_shot_invalid
  end

  def test_it_shows_users_play_results
    menu = Menu.new
    board = Board.new

    assert_equal "Your shot on #{} was a miss.", menu.user_shot_result_miss
    assert_equal "My shot on #{} was a miss.", menu.computer_shot_result_miss
    assert_equal "Your shot on #{} was a hit.", menu.user_shot_result_hit
    assert_equal "My shot on #{} was a hit.", menu.computer_shot_result_hit
    assert_equal "Your shot on #{} sunk a ship.", menu.user_shot_result_sunk
    assert_equal "My shot on #{} sunk a ship.", menu.computer_shot_result_sunk
    assert_equal "You won!", menu.user_won
    assert_equal "I won!", menu.computer_won
  end
end
