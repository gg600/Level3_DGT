extends Control


func _ready():
	LanguageManager.language_changed.connect(update_language)
	update_language()
	
	# Show the current music volume on the slider
	$PanelContainer/VBoxContainer/Music.value = MusicManager.music_volume
	$PanelContainer/VBoxContainer/SFX.value = SFXManager.sfx_volume

func _on_back_to_menu_pressed():
	SFXManager.play_mouse_click()
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func update_language():
	$PanelContainer/VBoxContainer/Sound.text = LanguageManager.get_text("sound_options")
	$PanelContainer/VBoxContainer/Confirmation.text = LanguageManager.get_text("options_info")
	$"PanelContainer/VBoxContainer/HBoxContainer/Back to Menu".text = LanguageManager.get_text("back_to_menu")


func _on_h_slider_value_changed(value: float) -> void:
	MusicManager.set_music_volume(value)


func _on_secret_button_pressed() -> void:
	SFXManager.play_mouse_click()
	$PanelContainer/VBoxContainer/Music.value = 100
	MusicManager.activate_secret_boost()


func _on_sfx_value_changed(value):
	SFXManager.set_sfx_volume(value)
