extends Area2D


@export_file("*.tscn") var destination_scene: String
var changing_scene := false
var global_player_position: String
var player: CharacterBody2D
var path

func _on_body_entered(body: Node2D) -> void:
	if changing_scene or not body.is_in_group("player"):
		return

	changing_scene = true

	var direction = body.direction_facing
	var next_level := Globals.level_number

	if direction == "right":
		next_level += 1
	elif direction == "left":
		next_level -= 1
	else:
		push_error("Unknown direction: " + str(direction))
		changing_scene = false
		return

	var next_path := "res://scenes/Part_{num}.tscn".format({"num": next_level})

	print("Direction: ", direction)
	print("Trying to load: ", next_path)

	if not ResourceLoader.exists(next_path):
		push_error("Scene does not exist: " + next_path)
		changing_scene = false
		return

	Globals.direction_facing = direction
	Globals.level_number = next_level
	get_tree().call_deferred("change_scene_to_file", next_path)
