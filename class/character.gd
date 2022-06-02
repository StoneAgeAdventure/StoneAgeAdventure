extends KinematicBody2D

class_name Character

enum State {IDLE, MOVE, ATTACK, DAMAGED, DEATH}
enum Weapon {BARE_HAND,KNIFE,SWORD1,SWORD2}
onready var _hp := 100
onready var _sp := 100
onready var _attack_point := 10
onready var _speed := 200.0
onready var _state = State.IDLE
onready var _weapon := []
onready var _present_weapon = Weapon.BARE_HAND

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

func set_health(hp: int):
	_hp = hp
	
func set_state(state):
	_state = state

func move(dist: Vector2):
	if _state == State.DAMAGED or _state == State.DEATH:
		return
		
	var _tmp := move_and_slide(dist)
	if dist != Vector2.ZERO:
		_state = State.MOVE
	else:
		_state = State.IDLE
		
func attack(ch: Character):
	ch.damage(_attack_point)
	ch._state = State.DAMAGED
	self._state = State.ATTACK

func damage(hp: int):
	self._state = State.DAMAGED
	_hp -= hp
	if _hp <= 0:
		death()

func death():
	_state = State.DEATH
	
func add_weapon(weapon : int):
	_weapon.append(weapon)
	
func set_weapon(weapon : int):
	_present_weapon = weapon
