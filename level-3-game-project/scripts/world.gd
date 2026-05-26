extends Node3D

func _ready() -> void:
	_create_trimesh_colliders($"first design proto")


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
