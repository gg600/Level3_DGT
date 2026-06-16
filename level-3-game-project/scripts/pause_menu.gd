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
	get_tree().paused = false
	visible = false
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _on_options_pressed():
	$OptionsPanel.show()
	$PausePanel.hide()



func _on_quit_pressed():
	$ConfirmationPanel.show()
	$PausePanel.hide()



func _on_return_pressed():
	$OptionsPanel.hide()
	$ConfirmationPanel.hide()
	$PausePanel.show()


func _on_main_menu_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
