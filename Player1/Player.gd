extends Sprite

enum State {IDLE, MOVE, ATTACK, DAMAGED, DEATH}

onready var _state = State.IDLE

onready var _hp := 100
onready var _sp := 100
onready var _attack_power := 10
onready var _speed := 4


func _process(_delta):
	var pressed := false
	
	if Input.is_action_pressed("move_left"):
		self.flip_h = true
		_state = State.MOVE
		self.position.x -= _speed
		pressed = true
	elif Input.is_action_pressed("move_right"):
		self.flip_h = false
		_state = State.MOVE
		self.position.x += _speed
		pressed = true
	if Input.is_action_pressed("move_up"):
		_state = State.MOVE
		self.position.y -= _speed
		pressed = true
	elif Input.is_action_pressed("move_down"):
		_state = State.MOVE
		self.position.y += _speed
		pressed = true
	
	if not pressed:
		_state = State.IDLE
	
	match _state:
		State.IDLE:
			$AnimationPlayer.stop(true)
			self.frame = 0
		State.MOVE:
			$AnimationPlayer.play("move")

func attack(obj):
	obj.damage(_attack_power)


func damage(hp: int):
	_hp -= hp
	if _hp <= 0:
		death()


func death():
	pass

