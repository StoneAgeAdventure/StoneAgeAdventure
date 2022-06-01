extends Node2D

export (Color) var border_color = Color.black
export (Color) var background_color = Color.aqua
export (Color) var foreground_color = Color.green
export (int) var hp_and_mp_value = 0

func _ready():
	var fg_style := StyleBoxFlat.new()
	var bg_style := StyleBoxFlat.new()
	fg_style.border_color = border_color
	fg_style.bg_color = foreground_color
	bg_style.border_color = border_color
	bg_style.bg_color = background_color
	
	fg_style.border_width_left = 2
	fg_style.border_width_top = 2
	fg_style.border_width_bottom = 2
	fg_style.corner_radius_bottom_left = 2
	fg_style.corner_radius_bottom_right = 2
	fg_style.corner_radius_top_left = 2
	fg_style.corner_radius_top_right = 2
	
	bg_style.border_width_left = 2
	bg_style.border_width_top = 2
	bg_style.border_width_bottom = 2
	bg_style.border_width_right = 2
	bg_style.corner_radius_bottom_left = 2
	bg_style.corner_radius_bottom_right = 2
	bg_style.corner_radius_top_left = 2
	bg_style.corner_radius_top_right = 2
	($ProgressBar.theme).set_stylebox("fg", "ProgressBar", fg_style)
	($ProgressBar.theme).set_stylebox("bg", "ProgressBar", bg_style)
	$ProgressBar.value = hp_and_mp_value

func _process(delta):
	pass
