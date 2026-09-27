extends Node

@onready var music: AudioStreamPlayer = $Music

func _ready() -> void:
	play_music()

func play_music():
	if !music.playing:
		music.play()

func stop_music():
	music.stop()

func set_music(stream: AudioStream):
	if music.stream != stream:
		music.stream = stream
		music.play()
