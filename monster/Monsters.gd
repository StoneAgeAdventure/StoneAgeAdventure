extends Node2D
onready var Dino = preload("res://characters/dinosaur_blue/DinosaurBlue.tscn")

func _ready():
	for i in 5:
		var newnode = Dino.instance()
		(newnode as Dino).position.x = 150
		(newnode as Dino).position.y = 100
		(newnode as Dino).z_index = 10
		(newnode as Dino).visible = true
		call_deferred("add_child",newnode)
