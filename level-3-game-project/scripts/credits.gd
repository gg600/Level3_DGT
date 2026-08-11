extends Control


func _ready():
	LanguageManager.language_changed.connect(update_language)
	update_language()


func _on_back_to_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func update_language():
	$PanelContainer/VBoxContainer/Credits.text = LanguageManager.get_text("credits")
	$"PanelContainer/VBoxContainer/Credit info".text = LanguageManager.get_text("credits_info")
	$"PanelContainer/VBoxContainer/HBoxContainer/Back to Menu".text = LanguageManager.get_text("back_to_menu")
