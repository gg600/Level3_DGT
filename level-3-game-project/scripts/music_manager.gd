extends Node

@onready var player = $AudioStreamPlayer

@export var menu_music: AudioStream
@export var game_music: AudioStream

@export var menu_volume_db := 0.0
@export var game_volume_db := -8.0

var music_volume := 50.0
var secret_boost := false


func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS

	set_music_volume(music_volume)
	play_menu_music()


func set_music_volume(value: float):
	music_volume = value
	secret_boost = false

	var music_bus = AudioServer.get_bus_index("Music")

	if value <= 0:
		AudioServer.set_bus_volume_db(music_bus, -80.0)
	else:
		AudioServer.set_bus_volume_db(
			music_bus,
			linear_to_db(value / 100.0)
		)


func activate_secret_boost():
	secret_boost = true
	music_volume = 100.0

	var music_bus = AudioServer.get_bus_index("Music")

	# +6 dB = approximately twice the linear amplitude
	AudioServer.set_bus_volume_db(music_bus, linear_to_db(4.0))


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
