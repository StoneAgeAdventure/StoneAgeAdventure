extends Control

class_name Blood
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var _magic_head = load("res://pictures/shop/barBlue_horizontalLeft.png")
var _magic_mid = load("res://pictures/shop/barBlue_horizontalBlue.png")
var _magic_tail = load("res://pictures/shop/barBlue_horizontalRight.png")
var _blood_head = load("res://pictures/shop/barGreen_horizontalLeft.png")
var _blood_mid = load("res://pictures/shop/barGreen_horizontalMid.png")
var _blood_tail = load("res://pictures/shop/barGreen_horizontalRight.png")
var _texture_head = null
var _texture_mid = null
var _texture_tail = null
enum Choice {BLOOD,MAGIC}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	set_blood_and_magic(20,1)
	set_blood_and_magic(20,1)
	set_blood_and_magic(20,1)


func set_blood_and_magic(amount: int,choice: int):
	
	if choice == Choice.BLOOD:
		_texture_head = _blood_head
		_texture_mid = _blood_mid
		_texture_tail = _blood_tail
	else:
		_texture_head = _magic_head
		_texture_mid = _magic_mid
		_texture_tail = _magic_tail
	if amount < 1:
		return
	var newnode =  TextureRect.new()
	(newnode as TextureRect).texture = _texture_head
	self.add_child(newnode)
	var tmp_len := 18 * amount + 9
	if amount > 2:
		newnode = TextureRect.new()
		(newnode as TextureRect).texture = _texture_mid
		(newnode as TextureRect).rect_scale = Vector2(amount, 1)
		(newnode as TextureRect).set_position(Vector2(9, 0))
		self.add_child(newnode)
	newnode = TextureRect.new()
	(newnode as TextureRect).texture = _texture_tail
	(newnode as TextureRect).rect_position = Vector2(tmp_len, 0)
	self.add_child(newnode)
		
