require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/menu'
require './lib/game'
require './lib/player'

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

game.place_ship(computer_player, computer_cruiser, ["A1", "B1", "C1"])
game.place_ship(computer_player, computer_submarine, ["B2", "C2"])
game.start
game.place_ship(user_player, user_cruiser)
game.place_ship(user_player, user_submarine)
