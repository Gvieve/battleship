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

    assert_equal false, board.ship_length_valid?(cruiser, ["A1", "A2"])
    assert_equal false, board.valid_placement?(cruiser, ["A1", "A2"])
    assert_equal false, board.valid_placement?(submarine, ["A2", "A3", "A4"])
  end

  def test_ship_has_valid_placement_letter_coordinates_consecutive
    skip
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal [65, 67], board.coordinates_ords(["A1", "C1"])
    assert_equal [[65, 66], [66, 67], [67, 68], [68, 69]], board.ordinates_consecutive(["A1", "C1"])
    assert_equal false, board.ship_letter_coords_valid?(cruiser, ["A1", "C1"])
    assert_equal false, board.valid_placement?(submarine, ["A1", "C1"])
    assert_equal false, board.valid_placement?(submarine, ["C1", "B1"])
  end

  def test_ship_has_valid_placement_number_coordinates_consecutive
    skip
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal [1, 2, 4], board.coordinates_nums(["A1", "A2", "A4"])
    assert_equal [[1, 2, 3], [2, 3, 4]], board.numbers_consecutive(["A1", "A2", "A4"])
    assert_equal false, board.ship_number_coords_valid?(cruiser, ["A1", "A2", "A4"])
    assert_equal false, board.valid_placement?(cruiser, ["A1", "A2", "A4"])
    assert_equal false, board.valid_placement?(cruiser, ["A3", "A2", "A1"])
  end

  def test_ship_coordinates_cant_be_diagonal
    skip
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal false, board.ship_diagonal_coords_valid?(cruiser, ["A1", "B2", "C3"])
    assert_equal false, board.valid_placement?(cruiser, ["A1", "B2", "C3"])
  end

  def test_checks_pass_valid_placement
    skip
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal true, board.valid_placement?(submarine, ["A1", "A2"])
    assert_equal true, board.valid_placement?(cruiser, ["B1", "C1", "D1"])
  end

  def test_placing_ships
    skip
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])
    cell_1 = board.cells["A1"]
    cell_2 = board.cells["A2"]
    cell_3 = board.cells["A3"]

    assert_equal cruiser, cell_1.ship
    assert_equal cruiser, cell_2.ship
    assert_equal cruiser, cell_3.ship
    assert_equal true, cell_3.ship == cell_2.ship
  end

  def test_placing_ships_invalid_coordinates
    skip
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A4"])

    assert_equal false, board.valid_placement?(cruiser, ["A1", "A2", "A4"])
    assert_equal nil, board.cells["A1"].ship
    assert_equal false, board.valid_placement?(cruiser, ["D3", "D4", "D5"])
    assert_equal nil, board.cells["D3"].ship
  end

  def test_overlapping_ships_cant_be_placed
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])
    submarine = Ship.new("Submarine", 2)
    # require "pry"; binding.pry

    assert_equal false, board.overlapping_ship?(["A1", "B1"])
    assert_equal false, board.valid_placement?(submarine, ["A1", "B1"])
  end
end
