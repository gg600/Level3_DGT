
extends PanelContainer

@onready var got_it_button: Button = $VBoxContainer/GotItButton

@onready var title_label = $VBoxContainer/Title
@onready var sprint_tip = $VBoxContainer/SprintTip
@onready var interact_tip = $VBoxContainer/InteractTip

# Tracks whether the tutorial has been completed this game session
static var tutorial_completed: bool = false


func _ready() -> void:
	# Allow the popup to work while the game is paused
	process_mode = Node.PROCESS_MODE_ALWAYS

	got_it_button.pressed.connect(_on_got_it_pressed)

	LanguageManager.language_changed.connect(update_text)
	update_text()

	if tutorial_completed:
		# Do not show the tutorial again this session
		hide()
		return

	# Show the tutorial and pause gameplay
	show()
	get_tree().paused = true
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func update_text():
	title_label.text = LanguageManager.get_text("quick_tips")
	sprint_tip.text = LanguageManager.get_text("sprint_tip")
	interact_tip.text = LanguageManager.get_text("interact_tip")
	got_it_button.text = LanguageManager.get_text("start_exploring")

func _on_got_it_pressed() -> void:
	# Remember that the tutorial has been completed
	tutorial_completed = true

	# Hide the popup and resume gameplay
	hide()
	get_tree().paused = false
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
