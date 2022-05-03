extends Sprite

class_name Character

enum Direction {UP, DOWN, LEFT, RIGHT, NONE}
enum State {IDLE, MOVE, ATTACK, DAMAGED, DEATH}

onready var _hp := 100
onready var _sp := 100
onready var _attack_point := 10
onready var _speed := 4
onready var _state = State.IDLE

func get_health() -> int:
	return _hp

func get_stamina() -> int:
	return _sp

func get_attack_point() -> int:
	return _attack_point

func get_speed() -> int:
	return _speed

func get_state():
	return _state

func set_attack_point(point: int):
	_attack_point = point

func set_speed(speed: int):
	_speed = speed

func set_state(state):
	_state = state

func move(direction):
	match direction:
		Direction.UP:
			self.position.y -= _speed
			set_state(State.MOVE)
		Direction.DOWN:
			self.position.y += _speed
			set_state(State.MOVE)
		Direction.LEFT:
			self.position.x -= _speed
			set_state(State.MOVE)
		Direction.RIGHT:
			self.position.x += _speed
			set_state(State.MOVE)
		Direction.NONE:
			set_state(State.IDLE)
		_:
			print("unexpected direction")
			assert(1 == 0)

func attack(ch: Character):
	ch.damage(_attack_point)

func damage(hp: int):
	_hp -= hp
	if _hp <= 0:
		death()

func death():
	_state = State.DEATH
