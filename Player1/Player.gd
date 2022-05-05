extends Character

onready var sprite := $Sprite
onready var animation_player := $Sprite/AnimationPlayer

func _ready():
	assert(sprite and animation_player)
	set_speed(100.0)

func _process(_delta):
	var pressed := false
	
	if Input.is_action_pressed("move_left"):
		sprite.flip_h = true
		move(Vector2(-get_speed(), 0))
		pressed = true
	elif Input.is_action_pressed("move_right"):
		sprite.flip_h = false
		move(Vector2(get_speed(), 0))
		pressed = true
	if Input.is_action_pressed("move_up"):
		move(Vector2(0, -get_speed()))
		pressed = true
	elif Input.is_action_pressed("move_down"):
		move(Vector2(0, get_speed()))
		pressed = true
	
	if not pressed:
		set_state(State.IDLE)
	
	match get_state():
		State.IDLE:
			animation_player.stop(true)
			sprite.frame = 0
		State.MOVE:
			animation_player.play("move")
