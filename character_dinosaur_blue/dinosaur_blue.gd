extends Character

onready var _rng := RandomNumberGenerator.new()
onready var _moving = Direction.NONE
onready var _movement := [Direction.UP, Direction.DOWN, Direction.LEFT, Direction.RIGHT]

func _ready():
	_rng.randomize()
	self.set_speed(3)

func _process(delta):
	move(_moving)

func random_state():
	var r := _rng.randi()
	
	if r % 3 == 0:
		_moving = _movement[_rng.randi() % len(_movement)]
		if _moving == Direction.LEFT:
			self.flip_h = true
		elif _moving == Direction.RIGHT:
			self.flip_h = false
		$AnimationPlayer.play("move")
	else:
		$AnimationPlayer.stop(true)
		self.frame = 0
		_moving = Direction.NONE

func _on_Timer_timeout():
	random_state()
