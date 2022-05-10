extends Control

onready var label = $Panel/RichTextLabel
signal buy()

func set_text(text: String):
	label.text = text

func _on_Buy_pressed():
	emit_signal("buy")

func _on_Cancel_pressed():
	self.hide()
