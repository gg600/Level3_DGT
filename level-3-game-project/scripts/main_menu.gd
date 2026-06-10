extends Control



func _ready():
	pass




func _on_new_game_pressed():
	get_tree().change_scene_to_file("res://scenes/world.tscn")


func _on_instructions_pressed():
	pass # Replace with function body.


func _on_options_pressed():
	pass # Replace with function body.


func _on_language_pressed():
	pass # Replace with function body.


func _on_quit_pressed():
	get_tree().change_scene_to_file("res://scenes/quit.tscn")


func _on_credits_pressed():
	pass # Replace with function body.
