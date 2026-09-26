extends Node2D

@onready var player: CharacterBody2D = $Player
@onready var spawn_from_left: Marker2D = $SpawnFromLeft
@onready var spawn_from_right: Marker2D = $SpawnFromRight


func _ready() -> void:
	Globals.level_number = 1
	
	if Globals.direction_facing == "left":
		# The player traveled left, so place them at this level's right entrance.
		player.global_position = spawn_from_right.global_position
		print("Spawned at right")
	else:
		# The player traveled right, so place them at this level's left entrance.
		player.global_position = spawn_from_left.global_position
		print("Spawned at left")

	player.velocity = Vector2.ZERO
