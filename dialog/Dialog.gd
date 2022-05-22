extends Control

onready var _dialog_label = $Panel/Label
onready var _timer = $Timer
var _dialog_text_length : int

func _ready():
	_dialog_label.hide()

func show_dialog():
	_dialog_label.visible_characters = 0
	_dialog_label.show()
	while true:
		_timer.start()
		if _dialog_label.visible_characters == _dialog_text_length:
			break
		
func setLabel(string : String):
	_dialog_label.text = string
	_dialog_text_length = string.length()
	show_dialog()

func _on_Timer_timeout():
	_dialog_label.visible_characters+=1
