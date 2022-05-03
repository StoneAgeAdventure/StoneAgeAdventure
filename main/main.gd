extends Control

func _ready():
	for i in range(10):
		add_child($Dino.duplicate())
