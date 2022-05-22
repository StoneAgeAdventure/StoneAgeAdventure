extends AudioStreamPlayer

onready var bgm_main_world = preload("res://sounds/maoudamashii/bgm_maoudamashii_acoustic44.mp3")

func _ready():
	self.stream = bgm_main_world
	self.play()
	self.volume_db = -10
