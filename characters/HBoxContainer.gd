extends HBoxContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var _magic_head = load("res://pictures/shop/barBlue_horizontalLeft.png")
var _magic_mid = load("res://pictures/shop/barBlue_horizontalBlue.png")
var _magic_tail = load("res://pictures/shop/barBlue_horizontalRight.png")
var _blood_head = load("res://pictures/shop/barGreen_horizontalLeft.png")
var _blood_mid = load("res://pictures/shop/barGreen_horizontalMid.png")
var _blood_tail = load("res://pictures/shop/barGreen_horizontalRight.png")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	set_blood(6)
	set_magic(8)
	
func set_blood(amount: int):
	if amount < 1:
		return
	var newnode = null
	print(1)
	newnode = TextureRect.new()
	(newnode as TextureRect).texture = _blood_head
	self.add_child(newnode)
	for i in amount-2:
		newnode = TextureRect.new()
		(newnode as TextureRect).texture = _blood_mid
		self.add_child(newnode)
	newnode = TextureRect.new()
	(newnode as TextureRect).texture = _blood_tail
	self.add_child(newnode)
		
func set_magic(amount: int):
	if amount < 1:
		return
	var newnode = null
	print(1)
	newnode = TextureRect.new()
	(newnode as TextureRect).texture = _magic_head
	self.add_child(newnode)
	for i in amount-2:
		newnode = TextureRect.new()
		(newnode as TextureRect).texture = _magic_mid
		self.add_child(newnode)
	newnode = TextureRect.new()
	(newnode as TextureRect).texture = _magic_tail
	self.add_child(newnode)
