extends CharacterBody3D

var speed = WALK_SPEED
const SPRINT_SPEED = 80.0
const WALK_SPEED = 5.0
const JUMP_VELOCITY = 4.5
const SPRINT_JUMP = 20
const SENSITIVITY = 0.008

# bob variables
const BOB_FREQ = 2.0
const BOB_AMP = 0.08
var t_bob = 0.0

# fov variables
const BASE_FOV = 75.0
const FOV_CHANGE = 1.5

@onready var head = $Head
@onready var camera = $Head/Camera3D


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _unhandled_input(event):
	if event is InputEventMouseMotion:
		head.rotate_y(-event.relative.x * SENSITIVITY)
		camera.rotate_x(-event.relative.y * SENSITIVITY)
		camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-40), deg_to_rad(60))


func _physics_process(delta):
	# Gravity
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Jump
	if Input.is_action_just_pressed("jump"):
		if Input.is_action_pressed("sprint"):
			velocity.y = SPRINT_JUMP 
		else:
			if is_on_floor():
				velocity.y = JUMP_VELOCITY

	# Sprint toggle
	speed = SPRINT_SPEED if Input.is_action_pressed("sprint") else WALK_SPEED

	# Movement input
	var input_dir = Input.get_vector("left", "right", "up", "down")
	var direction = (head.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()

	if is_on_floor():
		if direction:
			velocity.x = direction.x * speed
			velocity.z = direction.z * speed
		else:
			velocity.x = lerp(velocity.x, 0.0, delta * 7.0)
			velocity.z = lerp(velocity.z, 0.0, delta * 7.0)
	else:
		velocity.x = lerp(velocity.x, direction.x * speed, delta * 3.0)
		velocity.z = lerp(velocity.z, direction.z * speed, delta * 3.0)

	# Head bob (fixed timing)
	t_bob += velocity.length() * delta * float(is_on_floor())
	camera.transform.origin = _headbob(t_bob)

	"# FOV (fixed scaling)
	var velocity_clamped = clamp(velocity.length(), 0.0, SPRINT_SPEED)
	var target_fov = BASE_FOV + FOV_CHANGE * velocity_clamped
	camera.fov = lerp(camera.fov, target_fov, delta * 8.0)"

	move_and_slide()


func _headbob(time) -> Vector3:
	var pos = Vector3.ZERO
	pos.y = sin(time * BOB_FREQ) * BOB_AMP
	pos.x = cos(time * BOB_FREQ / 20.0) * BOB_AMP
	
	return pos
