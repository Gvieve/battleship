class Board
  attr_reader :cells,
              :coordinates
  def initialize
    @coordinates = coordinates
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

  def letters
    board_letters = []
    cells.keys.each do |letter|
      board_letters << letter[0]
    end
    board_letters.uniq
  end

  def consecutive_letters
    letters_validation = []
    letters.each_cons(3) do |letter|
      letters_validation << letter
    end

    letters.each_cons(2) do |letter|
      letters_validation << letter
    end
    letters_validation
  end

  def numbers
    board_numbers = []
    cells.keys.each do |number|
      board_numbers << number[1]
    end
    board_numbers.uniq
  end

  def consecutive_numbers
    numbers_validation = []
    numbers.each_cons(3) do |number|
      numbers_validation << number
    end

    numbers.each_cons(2) do |number|
      numbers_validation << number
    end
    numbers_validation
  end

  def valid_placement?(ship, coordinates)
    # require "pry"; binding.pry
    @coordinates = coordinates
    (coordinates.count == ship.length) &&
    (num_cons.include?(coordinates_nums))
  end

  def coordinates_ords
    ords = []
    coordinates.each do |coordinate|
      ords << coordinate.chop.ord
    end
    ords.uniq
  end

  def coordinates_nums
    nums = []
    coordinates.each do |coordinate|
      nums << coordinate[1..-1].to_i
    end
    nums.uniq
  end

  def num_cons
    consecutive = []
    (1..4).each_cons(coordinates.count) do |n|
      consecutive << n
    end
    consecutive
  end
end
