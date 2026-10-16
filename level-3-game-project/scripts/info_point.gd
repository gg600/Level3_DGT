extends Node3D

@export_category("Explorer")
@export var explorer_id := ""

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
	SFXManager.play_interface()

	var ui = get_tree().current_scene.get_node("InteractionUI")

	# Check whether this interaction completes the checklist.
	var was_incomplete = ExplorerManager.get_discovered_count() < ExplorerManager.locations.size()

	# Mark the location as discovered.
	if explorer_id != "":
		ExplorerManager.discover_location(explorer_id)

	# Skip the information popup only when the final
	# location is discovered for the first time.
	if was_incomplete and ExplorerManager.get_discovered_count() == ExplorerManager.locations.size():
		return

	# Display the information popup normally.
	if LanguageManager.current_language == "ja":
		ui.show_information(japanese_title, japanese_information)
	else:
		ui.show_information(english_title, english_information)
