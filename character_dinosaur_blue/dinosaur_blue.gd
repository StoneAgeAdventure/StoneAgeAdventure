extends Character

onready var _moving = Direction.NONE
onready var _movement := [Direction.UP, Direction.DOWN, Direction.LEFT, Direction.RIGHT]

func _ready():
	randomize()
	set_speed(randf() * 30 + 150)
	$Timer.start()

func _process(delta):
	move(_moving, delta)
	match get_state():
		State.MOVE:
			$AnimationPlayer.play("move")
		State.IDLE:
			$AnimationPlayer.stop(true)
			self.frame = 0
	
func random_state():
	set_speed(randf() * 30 + 150)
	if randi()%3 == 0:
		_moving = _movement[randi() % len(_movement)]
		if _moving == Direction.LEFT:
			self.flip_h = true
		elif _moving == Direction.RIGHT:
			self.flip_h = false
	else:
		_moving = Direction.NONE

func _on_Timer_timeout():
	random_state()
