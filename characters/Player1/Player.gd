extends Character

onready var sprite := $Sprite
onready var sprite2 := $Sprite2
onready var animation_player := $Sprite/AnimationPlayer
onready var timer := $Timer
var pressed: bool

func _ready():
	assert(sprite and animation_player)
	set_speed(75.0)
	pressed = false

func _process(_delta):
	if get_state() == State.ATTACK:
		return
	
	pressed = false
	if Input.is_action_pressed("move_left"):
		sprite.flip_h = true
		sprite2.flip_h = true
		move(Vector2(-get_speed(), 0))
		pressed = true
	elif Input.is_action_pressed("move_right"):
		sprite.flip_h = false
		sprite2.flip_h = false
		move(Vector2(get_speed(), 0))
		pressed = true
	if Input.is_action_pressed("move_up"):
		move(Vector2(0, -get_speed()))
		pressed = true
	elif Input.is_action_pressed("move_down"):
		move(Vector2(0, get_speed()))
		pressed = true
	if Input.is_action_pressed("attack") and get_state() != State.ATTACK:
		set_state(State.ATTACK)
		pressed = true
		
	if not pressed:
		set_state(State.IDLE)
		
	match get_state():
		State.IDLE:
			animation_player.stop(true)
			sprite.frame = 0
		State.MOVE:
			sprite.visible = true
			sprite2.visible = false
			if not animation_player.is_playing():
				animation_player.play("move")
		State.ATTACK:
			sprite2.visible = true
			sprite.visible = false
			animation_player.play("attack")
			timer.start()

func _on_Timer_timeout():
	set_state(State.IDLE)
