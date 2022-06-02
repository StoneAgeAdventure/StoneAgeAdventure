extends Node2D
export var weapon_num :int
onready var _accessary = $Node2D/TileMap
func _ready():
	set_weapon(weapon_num)
	
func set_weapon(weapon: int):
	(_accessary as TileMap).set_cellv(Vector2(1,1),weapon)
