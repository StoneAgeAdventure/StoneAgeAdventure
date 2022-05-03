extends Label

onready var _screen_width := get_viewport().size.x

func _ready():
	self.rect_position = Vector2(_screen_width - 100, 0)

func _process(delta):
	var fps := Engine.get_frames_per_second() as int
	var objects := get_tree().get_node_count()
	self.text = "Objects: %d\nFPS: %d" % [objects, fps]
