require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'

class BoardTest < Minitest::Test
  def test_it_exists_and_has_cells
    board = Board.new

    assert_instance_of Board, board
    assert_equal 16, board.cells.keys.count
  end

  def test_cells_have_valid_coordinate
    board = Board.new

    assert_equal true, board.valid_coordinate?("A1")
    assert_equal true, board.valid_coordinate?("D4")
    assert_equal false, board.valid_coordinate?("A5")
    assert_equal false, board.valid_coordinate?("E1")
    assert_equal false, board.valid_coordinate?("A22")
  end

  def test_ship_has_valid_placement
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal false, board.valid_placement?(cruiser, ["A1", "A2"])
    assert_equal false, board.valid_placement?(submarine, ["A2", "A3", "A4"])
    # assert_equal ["A", "B", "C", "D"], board.letters
    # expected = [["A", "B", "C"], ["B", "C", "D"], ["A", "B"], ["B", "C"], ["C", "D"]]
    # assert_equal expected, board.consecutive_letters
    # assert_equal ["1", "2", "3", "4"], board.numbers
    # expected = [["1", "2", "3"], ["2", "3", "4"], ["1", "2"], ["2", "3"], ["3", "4"]]
    # assert_equal expected, board.consecutive_numbers
    # assert_equal false, board.valid_placement?(cruiser, ["A1", "A2", "A4"])
    # assert_equal [65], board.coordinates_ords
    assert_equal false, board.valid_placement?(submarine, ["A1", "B1", "D1"])
    assert_equal [65, 66, 68], board.coordinates_ords

    assert_equal false, board.valid_placement?(cruiser, ["A1", "A2"])
    assert_equal [1, 2], board.coordinates_nums
    
    assert_equal [[1, 2], [2, 3], [3, 4]], board.num_cons
    assert_equal false, board.valid_placement?(cruiser, ["A1", "A2", "A4"])
  end
end
