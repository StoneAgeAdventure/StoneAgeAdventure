extends Character

func _process(_delta):
	var pressed := false
	
	if Input.is_action_pressed("move_left"):
		self.flip_h = true
		move(Direction.LEFT)
		pressed = true
	elif Input.is_action_pressed("move_right"):
		self.flip_h = false
		move(Direction.RIGHT)
		pressed = true
	if Input.is_action_pressed("move_up"):
		move(Direction.UP)
		pressed = true
	elif Input.is_action_pressed("move_down"):
		move(Direction.DOWN)
		pressed = true
	
	if not pressed:
		set_state(State.IDLE)
	
	match get_state():
		State.IDLE:
			$AnimationPlayer.stop(true)
			self.frame = 0
		State.MOVE:
			$AnimationPlayer.play("move")
