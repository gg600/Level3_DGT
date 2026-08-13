extends Control


func _ready():
	LanguageManager.language_changed.connect(update_language)
	update_language()


func _on_back_to_menu_pressed():
	SFXManager.play_mouse_click()
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_english_pressed():
	SFXManager.play_mouse_click()
	LanguageManager.set_language("en")


func _on_japanese_pressed():
	SFXManager.play_mouse_click()
	LanguageManager.set_language("ja")


func update_language():
	$PanelContainer/VBoxContainer/Language.text = LanguageManager.get_text("language")
	$PanelContainer/VBoxContainer/Pick.text = LanguageManager.get_text("pick_language")
	$"PanelContainer/VBoxContainer/Back to Menu".text = LanguageManager.get_text("back_to_menu")
