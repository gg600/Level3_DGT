extends CanvasLayer

@onready var panel = $Panel

func _ready():
	panel.visible = false

func show_information(title_text: String, info_text: String):
	panel.visible = true
	$Panel/VBoxContainer/Title.text = title_text
	$Panel/VBoxContainer/Description.text = info_text

	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func hide_information():
	panel.visible = false

	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _on_close_button_pressed():
	SFXManager.play_mouse_click()
	hide_information()
	
	
func is_open():
	return panel.visible
