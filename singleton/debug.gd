extends CanvasLayer

export var debug: bool = true
onready var _label = $Panel/Label

func _process(_delta):
	if debug: 
		var fps := Engine.get_frames_per_second() as int
		var objects := get_tree().get_node_count()
		_label.text = "Objects: %d\nFPS: %d" % [objects, fps]
