require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/menu'
require './lib/game'
require './lib/player'
require './lib/turn'

menu = Menu.new
computer_player = Player.new(@board)

user_player = Player.new(@board)

turn = Turn.new(menu, computer_player, user_player)
game = Game.new(menu, computer_player, user_player)

turn.place_ship(computer_player, computer_player.cruiser, ["A1", "B1", "C1"])
turn.place_ship(computer_player, computer_player.submarine, ["B2", "C2"])
game.start
turn.place_ship(user_player, user_player.cruiser)
turn.place_ship(user_player, user_player.submarine)
