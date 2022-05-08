extends Panel
signal apply_button_press(settings)

var _settings := {resolution = Vector2(1024,600),fullscreen = false, vsync = false}

func _on_ApplyButtton_pressed():
	emit_signal("apply_button_press", _settings)

func _on_Vsync_toggled(is_button_pressed):
	_settings.vsync = is_button_pressed

func _on_UIFullScreen_toggled(is_button_pressed):
	_settings.fullscreen = is_button_pressed
