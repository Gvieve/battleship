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
    menu = Menu.new
    computer_player = Player.new(@board)

    user_player = Player.new(@board)
    turn = Turn.new(menu, computer_player, user_player)

    assert_instance_of Turn, turn
    assert_equal menu, turn.menu
  end

  def test_it_can_place_ships
    menu = Menu.new
    computer_player = Player.new(@board)
    computer_cruiser = Ship.new("Cruiser", 3)
    computer_submarine = Ship.new("Submarine", 2)

    user_player = Player.new(@board)
    user_cruiser = Ship.new("Cruiser", 3)
    user_submarine = Ship.new("Submarine", 2)
    turn = Turn.new(menu, computer_player, user_player)

    turn.place_ship(computer_player, computer_player.cruiser, ["A1", "B1", "C1"])
    turn.place_ship(computer_player, computer_player.submarine, ["B2", "C2"])
  end

  def test_it_can_display_boards
    menu = Menu.new
    computer_player = Player.new(@board)
    computer_cruiser = Ship.new("Cruiser", 3)
    computer_submarine = Ship.new("Submarine", 2)

    user_player = Player.new(@board)
    user_cruiser = Ship.new("Cruiser", 3)
    user_submarine = Ship.new("Submarine", 2)
    turn = Turn.new(menu, computer_player, user_player)

    expected_1 = "=============COMPUTER BOARD============="
    expected_2 = "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n"
    expected_3 = "==============PLAYER BOARD=============="
    expected_4 = "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n"

    assert_equal expected_1 + "\n" + expected_2, turn.display_boards
  end
end
