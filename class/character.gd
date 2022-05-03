extends Node2D

class_name Character

enum Direction {UP, DOWN, LEFT, RIGHT}

onready var _hp := 100
onready var _sp := 100
onready var _attack_point := 10
onready var _speed := 4

func get_health() -> int:
	return _hp

func get_stamina() -> int:
	return _sp

func get_attack_point() -> int:
	return _attack_point

func get_speed() -> int:
	return _speed

func set_attack_point(point: int):
	_attack_point = point

func set_speed(speed: int):
	_speed = speed

func move(direction):
	match direction:
		Direction.UP:
			self.position.y -= _speed
		Direction.DOWN:
			self.position.y += _speed
		Direction.LEFT:
			self.position.x -= _speed
		Direction.RIGHT:
			self.position.x += _speed
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
	pass
