extends Control



func _ready():
	visible = false


func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		$OptionsPanel.hide()
		$ConfirmationPanel.hide()
		$PausePanel.show()
		get_tree().paused = !get_tree().paused
		visible = get_tree().paused

		if get_tree().paused:
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		else:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _on_resume_pressed():
	SFXManager.play_mouse_click()
	get_tree().paused = false
	visible = false
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _on_options_pressed():
	SFXManager.play_mouse_click()
	$OptionsPanel.show()
	$PausePanel.hide()



func _on_quit_pressed():
	SFXManager.play_mouse_click()
	$ConfirmationPanel.show()
	$PausePanel.hide()



func _on_return_pressed():
	SFXManager.play_mouse_click()
	$OptionsPanel.hide()
	$ConfirmationPanel.hide()
	$PausePanel.show()


func _on_main_menu_pressed():
	SFXManager.play_mouse_click()
	get_tree().paused = false
	MusicManager.play_menu_music()
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_h_slider_value_changed(value):
	MusicManager.set_music_volume(value)


func _on_sfx_value_changed(value):
	SFXManager.set_sfx_volume(value)
