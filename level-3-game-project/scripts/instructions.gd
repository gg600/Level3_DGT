extends Control


func _ready():
	pass


func _on_back_to_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_english_pressed():
	LanguageManager.set_language("en")


func _on_japanese_pressed():
	LanguageManager.set_language("ja")
