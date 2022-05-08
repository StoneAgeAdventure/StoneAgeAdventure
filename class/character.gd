extends KinematicBody2D

class_name Character

enum State {IDLE, MOVE, ATTACK, DAMAGED, DEATH}

onready var _hp := 100
onready var _sp := 100
onready var _attack_point := 10
onready var _speed := 200.0
onready var _state = State.IDLE

func get_health() -> int:
	return _hp

func get_stamina() -> int:
	return _sp

func get_attack_point() -> int:
	return _attack_point

func get_speed() -> float:
	return _speed

func get_state():
	return _state

func set_attack_point(point: int):
	_attack_point = point

func set_speed(speed: float):
	_speed = speed

func set_state(state):
	_state = state

func move(dist: Vector2):
	var _tmp := move_and_slide(dist)
	if dist != Vector2.ZERO:
		_state = State.MOVE
	else:
		_state = State.IDLE
		
func attack(ch: Character):
	ch.damage(_attack_point)
	

func damage(hp: int):
	_hp -= hp
	if _hp <= 0:
		death()

func death():
	_state = State.DEATH
