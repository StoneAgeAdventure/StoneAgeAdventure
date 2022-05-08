extends Node2D

onready var gameSettingPanel = $GameSettingPanel
func update_settings(settings: Dictionary) -> void:
	OS.window_fullscreen = settings.fullscreen
	OS.vsync_enabled = settings.vsync
	
func _on_GameSettingPanel_apply_button_press(settings):
	update_settings(settings)
	gameSettingPanel.visible = false

func _ready():
	gameSettingPanel.visible = false

func _on_SettingButton_pressed():
	gameSettingPanel.visible = true
