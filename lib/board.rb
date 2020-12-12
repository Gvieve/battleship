class Board
  attr_reader :cells,
              :coordinates
  def initialize
    @cells = {
             "A1" => Cell.new("A1"),
             "A2" => Cell.new("A2"),
             "A3" => Cell.new("A3"),
             "A4" => Cell.new("A4"),
             "B1" => Cell.new("B1"),
             "B2" => Cell.new("B2"),
             "B3" => Cell.new("B3"),
             "B4" => Cell.new("B4"),
             "C1" => Cell.new("C1"),
             "C2" => Cell.new("C2"),
             "C3" => Cell.new("C3"),
             "C4" => Cell.new("C4"),
             "D1" => Cell.new("D1"),
             "D2" => Cell.new("D2"),
             "D3" => Cell.new("D3"),
             "D4" => Cell.new("D4")
            }
  end

  def valid_coordinate?(coordinate)
    @cells.has_key?(coordinate)
  end

  def coordinates_ords(coordinates)
    ords = []
    coordinates.each do |coordinate|
      ords << coordinate.chop.ord
    end
    ords.uniq
  end

  def ordinates_consecutive(coordinates)
    consecutive_letter_ordinals = []
    (65..69).each_cons(coordinates.count) do |n|
      consecutive_letter_ordinals << n
    end
    consecutive_letter_ordinals
  end

  def coordinates_nums(coordinates)
    # require "pry"; binding.pry
    nums = []
    coordinates.each do |coordinate|
      nums << coordinate[1..-1].to_i
    end
    nums.uniq
  end

  def numbers_consecutive(coordinates)
    consecutive_numbers = []
    (1..4).each_cons(coordinates.count) do |n|
      consecutive_numbers << n
    end
    consecutive_numbers
  end

  def ship_length_valid?(ship, coordinates)
    coordinates.count == ship.length
  end

  def ship_letter_coords_valid?(ship, coordinates)
    (ordinates_consecutive(coordinates).include?(coordinates_ords(coordinates)) ||
    (coordinates_ords(coordinates).count == 1))
  end

  def ship_number_coords_valid?(ship, coordinates)
    (numbers_consecutive(coordinates).include?(coordinates_nums(coordinates)) ||
    (coordinates_nums(coordinates).count == 1))
  end

  def ship_diagonal_coords_valid?(ship, coordinates)
    (((ship_number_coords_valid?(ship, coordinates)) &&
    (ship_letter_coords_valid?(ship, coordinates))) &&
    (coordinates_ords(coordinates).count == 1) ||
    ((ship_number_coords_valid?(ship, coordinates)) &&
    (ship_letter_coords_valid?(ship, coordinates))) &&
    (coordinates_nums(coordinates).count == 1))

  end

  def overlapping_ship?(coordinates)
    coordinates.all? do |cell|
      cells[cell].ship.nil?
    end
  end

  def valid_placement?(ship, coordinates)
    @coordinates = coordinates
    ((ship_length_valid?(ship, coordinates)) &&
    (ship_letter_coords_valid?(ship, coordinates)) &&
    (ship_number_coords_valid?(ship, coordinates)) &&
    (ship_diagonal_coords_valid?(ship, coordinates)) &&
    (overlapping_ship?(coordinates)))
  end

  def place(ship, coordinates)
    if valid_placement?(ship, coordinates) == true
      cells.each do |coord, cell|
        if coordinates.include?(coord)
          cell.place_ship(ship)
        end
      end
    end
  end
end
