
extends PanelContainer

@onready var got_it_button: Button = $VBoxContainer/GotItButton

# Tracks whether the tutorial has been completed this game session
static var tutorial_completed: bool = false


func _ready() -> void:
	# Allow the popup to work while the game is paused
	process_mode = Node.PROCESS_MODE_ALWAYS

	got_it_button.pressed.connect(_on_got_it_pressed)

	if tutorial_completed:
		# Do not show the tutorial again this session
		hide()
		return

	# Show the tutorial and pause gameplay
	show()
	get_tree().paused = true
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE


func _on_got_it_pressed() -> void:
	# Remember that the tutorial has been completed
	tutorial_completed = true

	# Hide the popup and resume gameplay
	hide()
	get_tree().paused = false
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
