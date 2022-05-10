extends TileMap

signal choose_page1()
signal choose_page2()
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var _page1 := $Frame/Page1
onready var _page2 := $Frame/Page2

func _ready():
	_page1.show()
	_page2.hide()

func _on_choosePage1_pressed():
	_page1.show()
	_page2.hide()
	emit_signal("choose_page1")


func _on_choosePage2_pressed():
	_page2.show()
	_page1.hide()
	emit_signal("choose_page2")
