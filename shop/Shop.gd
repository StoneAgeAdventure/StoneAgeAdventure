extends Control

onready var _accessary = $ShopBoard/Accessary
var board_x
var board_y

func _ready():
	board_x = anchor_left
	board_y = anchor_right
	print(String(board_x)+String(board_y))
	_accessary.set_cellv(Vector2(10,10), 10)
