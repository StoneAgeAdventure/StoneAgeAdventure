extends Control

onready var label = $ColorRect/RichTextLabel

func set_text(text: String):
	label.text = text
