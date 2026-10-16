
extends PanelContainer

@onready var continue_button: Button = $MarginContainer/VBoxContainer/HBoxContainer/ContinueButton
@onready var main_menu_button: Button = $MarginContainer/VBoxContainer/HBoxContainer/MainMenuButton
@onready var title_label = $MarginContainer/VBoxContainer/Title
@onready var message_label = $MarginContainer/VBoxContainer/Message

var has_shown: bool = false


func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS

	hide()

	continue_button.pressed.connect(_on_continue_pressed)
	main_menu_button.pressed.connect(_on_main_menu_pressed)

	ExplorerManager.all_locations_discovered.connect(_on_all_locations_discovered)
	
	LanguageManager.language_changed.connect(update_language)
	update_language()


func _on_all_locations_discovered() -> void:
	if has_shown:
		return

	has_shown = true
	show()

	get_tree().paused = true
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE


func _on_continue_pressed() -> void:
	hide()
	get_tree().paused = false
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _on_main_menu_pressed() -> void:
	SFXManager.play_mouse_click()

	get_tree().paused = false
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

	MusicManager.play_menu_music()
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	
func update_language():
	title_label.text = LanguageManager.get_text("win_title")
	message_label.text = LanguageManager.get_text("win_message")
	continue_button.text = LanguageManager.get_text("continue_exploring")
	main_menu_button.text = LanguageManager.get_text("return_to_main_menu")
