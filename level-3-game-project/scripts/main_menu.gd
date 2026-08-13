extends Control



func _ready():
	LanguageManager.language_changed.connect(update_language)
	update_language()


func update_language():
	$"VBoxContainer/New Game".text = LanguageManager.get_text("new_game")
	$VBoxContainer/Instructions.text = LanguageManager.get_text("instructions")
	$VBoxContainer/Options.text = LanguageManager.get_text("options")
	$VBoxContainer/Language.text = LanguageManager.get_text("language")
	$VBoxContainer/Quit.text = LanguageManager.get_text("quit")
	$Credits.text = LanguageManager.get_text("credits")

func _on_new_game_pressed():
	SFXManager.play_mouse_click()
	get_tree().change_scene_to_file("res://scenes/world.tscn")


func _on_instructions_pressed():
	SFXManager.play_mouse_click()
	get_tree().change_scene_to_file("res://scenes/instructions.tscn")


func _on_options_pressed():
	SFXManager.play_mouse_click()
	get_tree().change_scene_to_file("res://scenes/options.tscn")


func _on_language_pressed():
	SFXManager.play_mouse_click()
	get_tree().change_scene_to_file("res://scenes/language.tscn")


func _on_quit_pressed():
	SFXManager.play_mouse_click()
	get_tree().change_scene_to_file("res://scenes/quit.tscn")


func _on_credits_pressed():
	SFXManager.play_mouse_click()
	get_tree().change_scene_to_file("res://scenes/credits.tscn")
