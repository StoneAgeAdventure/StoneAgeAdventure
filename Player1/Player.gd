extends Character

enum State {IDLE, MOVE, ATTACK, DAMAGED, DEATH}

onready var _state = State.IDLE

func _process(_delta):
	var pressed := false
	
	if Input.is_action_pressed("move_left"):
		self.flip_h = true
		_state = State.MOVE
		move(Character.Direction.LEFT)
		pressed = true
	elif Input.is_action_pressed("move_right"):
		self.flip_h = false
		_state = State.MOVE
		move(Character.Direction.RIGHT)
		pressed = true
	if Input.is_action_pressed("move_up"):
		_state = State.MOVE
		move(Character.Direction.UP)
		pressed = true
	elif Input.is_action_pressed("move_down"):
		_state = State.MOVE
		move(Character.Direction.DOWN)
		pressed = true
	
	if not pressed:
		_state = State.IDLE
	
	match _state:
		State.IDLE:
			$AnimationPlayer.stop(true)
			self.frame = 0
		State.MOVE:
			$AnimationPlayer.play("move")
