extends Control


func _ready():
	LanguageManager.language_changed.connect(update_language)
	update_language()


func _on_cancel_pressed():
	SFXManager.play_mouse_click()
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_quit_pressed():
	SFXManager.play_mouse_click()
	get_tree().quit()

func update_language():
	$PanelContainer/VBoxContainer/Quit.text = LanguageManager.get_text("quit")
	$PanelContainer/VBoxContainer/Confirmation.text = LanguageManager.get_text("quit_confirmation")
	$PanelContainer/VBoxContainer/HBoxContainer/Cancel.text = LanguageManager.get_text("cancel")
	$PanelContainer/VBoxContainer/HBoxContainer/Quit.text = LanguageManager.get_text("quit")
