extends Node

@onready var player = $SFXPlayer

var footsteps = preload("res://assests/Audio/freesound_community-concrete-footsteps-1-6265.mp3")
var success = preload("res://assests/Audio/freesound_community-success-1-6297.mp3")
var mouse_click = preload("res://assests/Audio/matthewvakaliuk73627-mouse-click-290204.mp3")
var interface_sound = preload("res://assests/Audio/soundreality-interface-12-204786.mp3")

var sfx_volume := 50.0


func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS
	
	set_sfx_volume(sfx_volume)
	
	player.bus = "SFX"


func set_sfx_volume(value: float):
	sfx_volume = value
	
	var sfx_bus = AudioServer.get_bus_index("SFX")
	
	if value <= 0:
		AudioServer.set_bus_volume_db(sfx_bus, -80.0)
	else:
		AudioServer.set_bus_volume_db(
			sfx_bus,
			linear_to_db(value / 100.0)
		)


func play_footsteps():
	player.stream = footsteps
	player.play()


func play_success():
	player.stream = success
	player.play()


func play_mouse_click():
	player.stream = mouse_click
	player.play()


func play_interface():
	player.stream = interface_sound
	player.play()
