extends RigidBody2D
class_name Bullet
onready var _bullet_player = $Sprite/AnimationPlayer
var disabled = false
func _ready():
	$Timer.start()

func shoot():
	_bullet_player.play("shoot")


func _on_Timer_timeout():
	if disabled:
		return
	self.queue_free()
	disabled = true
