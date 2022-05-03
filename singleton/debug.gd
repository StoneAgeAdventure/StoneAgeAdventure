extends Node2D

onready var _screen_width := get_viewport().size.x
onready var _label := Label.new()

func _ready():
	self.position = Vector2(_screen_width - 100, 0)
	self.z_index = VisualServer.CANVAS_ITEM_Z_MAX
	add_child(_label)

func _process(_delta):
	self.position = Vector2(_screen_width - 100, 0)
	var fps := Engine.get_frames_per_second() as int
	var objects := get_tree().get_node_count()
	_label.text = "Objects: %d\nFPS: %d" % [objects, fps]
