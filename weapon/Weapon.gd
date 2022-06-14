extends Sprite
onready var _weapon_num :int

onready var _accessary = $TileMap
onready var _node2d_anchor = $TileMap
const TURN_RIGHT_HAND_X_AXIS = -8.88
const TURN_LEFT_HAND_X_AXIS = -6 #decide sword position
func _ready():
	pass

func _set_weapon(weapon: int,flip: bool):#flip true means turn left
	if flip == true:
		_node2d_anchor.position.x = TURN_LEFT_HAND_X_AXIS
		(_accessary as TileMap).clear()
		(_accessary as TileMap).set_cellv(Vector2(-1,0),weapon,true)
	else:
		_node2d_anchor.position.x = TURN_RIGHT_HAND_X_AXIS
		(_accessary as TileMap).clear()
		(_accessary as TileMap).set_cellv(Vector2(0,0),weapon,false)
