extends Sprite

onready var _hp := 100
onready var _sp := 100
onready var _attack_power := 10

func attack(obj):
	obj.damage(_attack_power)


func damage(hp: int):
	_hp -= hp
	if _hp <= 0:
		death()


func death():
	pass

