extends Character
class_name Dino
var _moving := Vector2()

onready var sprite := $Dino
onready var animation_player := $Dino/AnimationPlayer
onready var timer := $Dino/Timer

func _ready():
	randomize()
	assert(sprite)
	set_speed(randf() * 10 + 50)
	timer.start()

func _process(_delta):
	move(_moving)
	match get_state():
		State.MOVE:
			animation_player.play("move")
		State.IDLE:
			animation_player.stop(true)
			sprite.frame = 0
	
func random_state():
	set_speed(randf() * 10 + 50)
	if randi()%3 == 0:
		match randi() % 4:
			0:
				_moving = Vector2(-get_speed(), 0)
				sprite.flip_h = true
			1:
				_moving = Vector2(get_speed(), 0)
				sprite.flip_h = false
			2:
				_moving = Vector2(0, -get_speed())
			3:
				_moving = Vector2(0, get_speed())
	else:
		_moving = Vector2()

func _on_Timer_timeout():
	random_state()

func _on_Area2D_body_entered(body):
	if body is Bullet:
		print("Dino got hit")
