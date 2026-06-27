extends Control



func _ready():
	pass




func _on_new_game_pressed():
	get_tree().change_scene_to_file("res://scenes/world.tscn")


func _on_instructions_pressed():
	get_tree().change_scene_to_file("res://scenes/instructions.tscn")


func _on_options_pressed():
	get_tree().change_scene_to_file("res://scenes/options.tscn")


func _on_language_pressed():
	get_tree().change_scene_to_file("res://scenes/language.tscn")


func _on_quit_pressed():
	get_tree().change_scene_to_file("res://scenes/quit.tscn")


func _on_credits_pressed():
	get_tree().change_scene_to_file("res://scenes/credits.tscn")
