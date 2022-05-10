extends CanvasLayer

onready var _screen_width := get_viewport().size.x
onready var _label := Label.new()

var debug: bool

func _ready():
	_label.rect_position = Vector2(1200, 0)
	add_child(_label)

func _process(_delta):
	if debug: 
		var fps := Engine.get_frames_per_second() as int
		var objects := get_tree().get_node_count()
		_label.text = "Objects: %d\nFPS: %d" % [objects, fps]
