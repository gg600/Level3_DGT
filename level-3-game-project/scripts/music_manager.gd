extends Node

@onready var player = $AudioStreamPlayer

@export var menu_music: AudioStream
@export var game_music: AudioStream

@export var menu_volume_db := 0.0
@export var game_volume_db := -8.0


func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS
	play_menu_music()


func play_menu_music():
	if player.stream == menu_music and player.playing:
		return

	player.stop()
	player.stream = menu_music
	player.volume_db = menu_volume_db
	player.play()


func play_game_music():
	if player.stream == game_music and player.playing:
		return

	player.stop()
	player.stream = game_music
	player.volume_db = game_volume_db
	player.play()
