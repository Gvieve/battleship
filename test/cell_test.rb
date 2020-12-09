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
    skip
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    assert_equal true, cell.empty?
    cell.place_ship(cruiser)
    assert_equal false, cell.empty?
  end

  def test_it_can_be_fired_upon
    skip
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    cell.place_ship(cruiser)
    assert_equal false, cell.fired_upon?
    cell.fire_upon
    assert_equal 2, cell.ship.health
    assert_equal true, cell.fired_upon?
  end

  def test_the_cell_renders_on_the_screen
    cell_1 = Cell.new("B4")
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)

    cell_1.render

    assert_equal ".", cell_1.render

    cell_1.fire_upon
    cell_1.render

    assert_equal "M", cell_1.render
    #
    # cell_2.place_ship(cruiser)
    # cell_2.render
    #
    # assert_equal ".", cell_2.render
  end
end
