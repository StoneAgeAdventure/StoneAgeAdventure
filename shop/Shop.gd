extends Node2D

onready var _accessary = $Control/ShopBoard/Accessary

func _ready():
	print("s")
	_accessary.set_cell(200,200, 10)
