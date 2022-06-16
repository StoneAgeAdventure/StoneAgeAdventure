extends CanvasLayer

export var debug: bool = true
onready var _label = $Panel/Label

func _process(_delta):
	if debug: 
		var fps := Engine.get_frames_per_second() as int
		var mem := OS.get_static_memory_usage() / 1024.0 / 1024.0
		var objects := get_tree().get_node_count()
		_label.text = "Objects: %d\nMem: %.1fM\nFPS: %d" % [objects, mem, fps]
