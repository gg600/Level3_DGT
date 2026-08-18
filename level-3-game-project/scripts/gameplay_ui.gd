extends PanelContainer


@onready var progress_label = $ExplorerPanel/Progress
@onready var location_notification = $"../NotificationLayer/LocationNotification"
@onready var location_title = $"../NotificationLayer/LocationNotification/VBoxContainer/LocationTitle"
@onready var location_progress = $"../NotificationLayer/LocationNotification/VBoxContainer/LocationProgress"

@onready var location_buttons = {
	"astro_courts": $"ExplorerPanel/LocationList/Astro Courts",
	"canteen": $ExplorerPanel/LocationList/Canteen,
	"chapel": $ExplorerPanel/LocationList/Chapel,
	"cooking_room": $ExplorerPanel/LocationList/"Cooking Room",
	"gymnasium": $ExplorerPanel/LocationList/Gymnasium,
	"library": $ExplorerPanel/LocationList/Library,
	"music_suite": $ExplorerPanel/LocationList/"Music Suite",
	"sports_fields": $ExplorerPanel/LocationList/"Sports Fields",
	"student_reception": $ExplorerPanel/LocationList/"Student Reception",
	"whare_haoini_paora": $ExplorerPanel/LocationList/"Whare Haoini Paora"
}


func _ready():
	visible = false
	
	ExplorerManager.location_discovered.connect(_on_location_discovered)
	
	update_checklist()


func _input(event):
	if event is InputEventKey:
		if event.pressed and not event.echo and event.keycode == KEY_TAB:
			visible = !visible


func _on_location_discovered(location_id: String):
	SFXManager.play_success()
	update_checklist()
	show_location_notification(location_id)

func show_location_notification(location_id: String):
	var discovered_count = ExplorerManager.get_discovered_count()
	
	var location_name = location_id.replace("_", " ").capitalize()
	
	location_title.text = "LOCATION DISCOVERED!"
	location_progress.text = location_name + " — " + str(discovered_count) + " / 10 Locations Discovered"
	
	location_notification.show()
	
	await get_tree().create_timer(3.0).timeout
	
	location_notification.hide()


func update_checklist():
	var discovered_count = ExplorerManager.get_discovered_count()
	
	progress_label.text = str(discovered_count) + " / 10 Locations Discovered"
	
	for location_id in location_buttons:
		location_buttons[location_id].button_pressed = ExplorerManager.is_discovered(location_id)
