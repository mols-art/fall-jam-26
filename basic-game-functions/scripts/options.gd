extends Control

@onready var fullscreen_button: CheckButton = $VBoxContainer/FullscreenButton


func _ready() -> void:
	fullscreen_button.set_pressed_no_signal(
		DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN)

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu.tscn")


func _on_fullscreen_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
