extends Camera2D

func _process(delta):
	self.position = get_node("../Player").position