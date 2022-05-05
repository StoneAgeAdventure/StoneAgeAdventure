extends Control

func _ready():
	for _i in range(10):
		add_child($Dino.duplicate())
