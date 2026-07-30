extends Node3D

@export_category("English")
@export var english_title := "Science Block"

@export_multiline
var english_information := "Information goes here."

@export_category("Japanese")
@export var japanese_title := "理科棟"

@export_multiline
var japanese_information := "情報を入力してください。"

var player_near := false


func _ready():
	$Label3D.visible = false
	$AnimationPlayer.play("Idle")


func _on_area_3d_body_entered(body):
	if body.is_in_group("Player"):
		player_near = true
		$Label3D.visible = true
		body.current_interactable = self


func _on_area_3d_body_exited(body):
	if body.is_in_group("Player"):
		player_near = false
		$Label3D.visible = false

		if body.current_interactable == self:
			body.current_interactable = null


func interact():
	var ui = get_tree().current_scene.get_node("InteractionUI")

	if LanguageManager.current_language == "ja":
		ui.show_information(japanese_title, japanese_information)
	else:
		ui.show_information(english_title, english_information)
