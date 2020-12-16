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
    computer_board = Board.new
    computer_player = Player.new(computer_board)
    user_board = Board.new
    user_player = Player.new(user_board)
    game = Game.new(menu, computer_player, user_player)

    assert_instance_of Game, game
    assert_equal menu, game.menu
    assert_equal computer_player, game.computer_player
    assert_equal user_player, game.user_player
  end

  def test_computer_can_place_ships
    menu = Menu.new

    computer_board = Board.new
    computer_player = Player.new(computer_board)
    computer_cruiser = Ship.new("Cruiser", 3)
    computer_submarine = Ship.new("Submarine", 2)

    user_board = Board.new
    user_player = Player.new(user_board)
    user_cruiser = Ship.new("Cruiser", 3)
    user_submarine = Ship.new("Submarine", 2)

    game = Game.new(menu, computer_player, user_player)

    assert_equal computer_board.cells, game.place_ship(computer_player, computer_cruiser, ["A1", "B1", "C1"])
    assert_equal computer_board.cells, game.place_ship(computer_player, computer_submarine, ["B2", "C2"])

    game.player_board_message

    game.place_ship(user_player, user_cruiser)
    assert_equal false, game.all_ships_are_not_placed(user_player)

    game.place_ship(user_player, user_submarine)


    # assert_equal user_board.cells, game.place_ship(user_player, user_cruiser)
    # puts menu.enter_coords_submarine
    # assert_equal user_board.cells, game.place_ship(user_player, user_submarine)
    # game.user_player.board.render(true) to see user board
  end
end
