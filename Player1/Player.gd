extends Area2D


func _on_Player_body_entered(body):
	hide()
	print("got hit")
	#for the sake that we don't triggrer the hitsignal more than once
	#$CollisionShape2D.set_deferred("disabled", true)

func _ready():
	set_speed(200.0)

func _process(delta):
	var pressed := false
	
	if Input.is_action_pressed("move_left"):
		self.flip_h = true
		move(Direction.LEFT, delta)
		pressed = true
	elif Input.is_action_pressed("move_right"):
		self.flip_h = false
		move(Direction.RIGHT, delta)
		pressed = true
	if Input.is_action_pressed("move_up"):
		move(Direction.UP, delta)
		pressed = true
	elif Input.is_action_pressed("move_down"):
		move(Direction.DOWN, delta)
		pressed = true
	
	if not pressed:
		set_state(State.IDLE)
	
	match get_state():
		State.IDLE:
			$AnimationPlayer.stop(true)
			self.frame = 0
		State.MOVE:
			$AnimationPlayer.play("move")

