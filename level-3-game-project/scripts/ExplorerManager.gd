extends Node

signal location_discovered(location_id)

var locations = {
	"astro_courts": false,
	"canteen": false,
	"chapel": false,
	"cooking_room": false,
	"gymnasium": false,
	"library": false,
	"music_suite": false,
	"sports_fields": false,
	"student_reception": false,
	"whare_haoini_paora": false
}


func discover_location(location_id: String):
	if not locations.has(location_id):
		return
	
	if locations[location_id]:
		return
	
	locations[location_id] = true
	location_discovered.emit(location_id)


func is_discovered(location_id: String) -> bool:
	if locations.has(location_id):
		return locations[location_id]
	
	return false


func get_discovered_count() -> int:
	var count := 0
	
	for location in locations:
		if locations[location]:
			count += 1
	
	return count
