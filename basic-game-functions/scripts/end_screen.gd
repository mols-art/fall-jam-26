extends Control



func _on_restart_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Part_1.tscn")
	Globals.has_crossed_level_1_scene_exit = false
	Globals.has_crossed_level_2_scene_exit = false
	Globals.has_crossed_level_3_scene_exit = false
	Globals.has_crossed_level_4_scene_exit = false
	Globals.has_crossed_level_5_scene_exit = false

func _on_exit_pressed() -> void:
	get_tree().quit()
