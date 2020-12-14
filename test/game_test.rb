require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/menu'
require './lib/game'

class GameTest < Minitest::Test
  def test_it_exists_and_has_attributes
    menu = Menu.new
    board = Board.new
    game = Game.new(menu, board)

    assert_instance_of Game, game
    assert_equal menu, game.menu
    assert_equal board, game.board
    # assert_equal "Welcome to BATTLESHIP", game.start
    # assert_equal "Enter p to play. Enter q to quit.", menu.play
  end

  # need to create two boards when creating game
  def test_computer_can_place_ships
    menu = Menu.new
    board_1 = Board.new
    game = Game.new(menu, board_1)
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal board_1.cells, game.computer_place_ship(cruiser, ["A1", "B1", "C1"])
    assert_equal board_1.cells, game.computer_place_ship(submarine, ["D2", "D3"])
  end

  def test_player_can_place_ships
    menu = Menu.new
    board_1 = Board.new
    board_2 = Board.new
    game = Game.new(menu, board)
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal "", game.player_board_message
    assert_equal board_2.cells, game.player_place_ship(cruiser, ["A1", "B1", "C1"])
    assert_equal board_2.cells, game.player_place_ship(submarine, ["D2", "D3"])
  end

end
