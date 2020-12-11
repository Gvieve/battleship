require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'

class BoardTest < Minitest::Test
  def test_it_exists_and_has_cells
    skip
    board = Board.new

    assert_instance_of Board, board
    assert_equal 16, board.cells.keys.count
  end

  def test_cells_have_valid_coordinate
    skip
    board = Board.new

    assert_equal true, board.valid_coordinate?("A1")
    assert_equal true, board.valid_coordinate?("D4")
    assert_equal false, board.valid_coordinate?("A5")
    assert_equal false, board.valid_coordinate?("E1")
    assert_equal false, board.valid_coordinate?("A22")
  end

  def test_ship_has_valid_placement_length_of_ship
    skip
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal false, board.valid_placement?(cruiser, ["A1", "A2"])
    assert_equal false, board.valid_placement?(submarine, ["A2", "A3", "A4"])
  end

  def test_ship_has_valid_placement_letter_coordinates_consecutive
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal false, board.valid_placement?(submarine, ["A1", "C1"])
    assert_equal [65, 67], board.coordinates_ords

    assert_equal [[65, 66], [66, 67], [67, 68], [68, 69]], board.ordinates_consecutive
    assert_equal false, board.valid_placement?(submarine, ["A1", "C1"])
  end
  # above test is passing, and not failing as expected
  # we found out in valid_placement? that num_cons method conditional when
  # evaluated has not actually run yet. We got cant find method error with .count

  def test_ship_has_valid_placement_number_coordinates_consecutive
    skip
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal false, board.valid_placement?(cruiser, ["A1", "A2"])
    assert_equal [1, 2], board.coordinates_nums

    assert_equal [[1, 2], [2, 3], [3, 4]], board.num_cons
    assert_equal false, board.valid_placement?(cruiser, ["A1", "A2", "A4"])
  end
end
