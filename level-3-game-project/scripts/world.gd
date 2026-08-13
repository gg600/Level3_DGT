extends Node3D

func _ready() -> void:
	MusicManager.play_game_music()
	_create_trimesh_colliders($"first design proto")
	LanguageManager.language_changed.connect(update_language)
	update_language()
	
	$PauseMenu/OptionsPanel/VBoxContainer/Music.value = MusicManager.music_volume
	$PauseMenu/OptionsPanel/VBoxContainer/SFX.value = SFXManager.sfx_volume

	
	
func _create_trimesh_colliders(root: Node) -> void:
	for child in root.get_children():
		_create_trimesh_colliders(child)

	if root is MeshInstance3D:
		var mesh_instance := root as MeshInstance3D
		if mesh_instance.mesh == null:
			return

		var static_body := StaticBody3D.new()
		static_body.name = "%s_Collider" % mesh_instance.name
		mesh_instance.add_child(static_body)
		static_body.owner = get_tree().edited_scene_root

		var collision_shape := CollisionShape3D.new()
		collision_shape.shape = mesh_instance.mesh.create_trimesh_shape()
		static_body.add_child(collision_shape)
		collision_shape.owner = get_tree().edited_scene_root
		
		
		
func update_language():
	$PauseMenu/PausePanel/VBoxContainer/Pause.text = LanguageManager.get_text("pause")
	$PauseMenu/PausePanel/VBoxContainer/Info.text = LanguageManager.get_text("pause_description")
	$PauseMenu/PausePanel/VBoxContainer/Resume.text = LanguageManager.get_text("resume")
	$PauseMenu/PausePanel/VBoxContainer/Options.text = LanguageManager.get_text("options")
	$"PauseMenu/PausePanel/VBoxContainer/Main Menu".text = LanguageManager.get_text("main_menu")

	$"PauseMenu/OptionsPanel/VBoxContainer/Sound Options".text = LanguageManager.get_text("sound_options")
	$"PauseMenu/OptionsPanel/VBoxContainer/Options Info".text = LanguageManager.get_text("options_info")
	$PauseMenu/OptionsPanel/VBoxContainer/HBoxContainer/Return.text = LanguageManager.get_text("return")

	$PauseMenu/ConfirmationPanel/VBoxContainer/Quit.text = LanguageManager.get_text("quit")
	$PauseMenu/ConfirmationPanel/VBoxContainer/Confirmation.text = LanguageManager.get_text("quit_confirmation")
	$"PauseMenu/ConfirmationPanel/VBoxContainer/HBoxContainer/Return to pause".text = LanguageManager.get_text("return_to_pause")
	$"PauseMenu/ConfirmationPanel/VBoxContainer/HBoxContainer/Main Menu".text = LanguageManager.get_text("main_menu")
