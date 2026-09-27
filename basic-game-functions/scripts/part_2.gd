extends Node2D

@onready var player: CharacterBody2D = $Player
@onready var spawn_from_left: Marker2D = $SpawnFromLeft
@onready var spawn_from_right: Marker2D = $SpawnFromRight


func _ready() -> void:
	Globals.level_number = 2
	AudioManager.play_music()
	
	if Globals.has_crossed_level_2_scene_exit:
		player.global_position = spawn_from_right.global_position
