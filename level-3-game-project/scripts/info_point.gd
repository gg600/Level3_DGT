
extends Node3D

@export var title := "Science Block"

@export_multiline
var information := "Information goes here."

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
	get_tree().current_scene.get_node("InteractionUI").show_information(title, information)
