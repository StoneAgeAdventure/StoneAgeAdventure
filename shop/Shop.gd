extends Control

onready var _accessary = $ShopBoard/Accessary
onready var _shop_board = $ShopBoard
onready var _accessary_document = $AccessaryDocument
var _board_x
var _board_y
var _mouse_click_position: Vector2 #mouse_click_position - board left-up position
const CELL_LENGTH : int = 32
const BOARD_WIDTH_AVAILABLE : int = 9
var _weapon_detail = ["棍子","銀劍","劍","銀劍","劍","銀劍","劍","銀劍","劍","銀劍","劍"]
var _accessary_detail = ["血量"]
func _ready():
	_board_x = _shop_board.position.x
	_board_y = _shop_board.position.y
	_accessary_document.hide()
	for i in range(1,10):
		_accessary.set_cellv(Vector2(i,1),i)

func _process(_delta):
	if Input.is_action_pressed("mouse_click") and not _accessary_document.is_visible_in_tree():
		_mouse_click_position = get_local_mouse_position() - Vector2(_board_x,_board_y)
		
		_accessary_document.set_text(_weapon_detail[_within_cell().x])
		_accessary_document.show()
		
	
	
	
func _within_cell() -> Vector2:
	var x_axis = int(_mouse_click_position.x) / CELL_LENGTH
	var y_axis = int(_mouse_click_position.y) / CELL_LENGTH
	return Vector2(x_axis,y_axis)


func _on_AccessaryDocument_buy():
	pass # Replace with function body.
