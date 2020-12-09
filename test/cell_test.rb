require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'

class CellTest < Minitest::Test
  def test_it_exists_and_had_attributes
    cell = Cell.new("B4")

    assert_instance_of Cell, cell
    assert_equal "B4", cell.coordinate
    assert_equal nil, cell.ship
    assert_equal true, cell.empty?
  end

  def test_cell_has_a_ship
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    assert_equal true, cell.empty?
    cell.place_ship(cruiser)
    assert_equal false, cell.empty?
  end

  def test_it_can_be_fired_upon
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    cell.place_ship(cruiser)
    assert_equal false, cell.fired_upon?
    cell.fire_upon
    assert_equal 2, cell.ship.health
  end
end
