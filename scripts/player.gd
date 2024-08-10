extends CharacterBody3D

@export var cam : Camera3D
var sensitivity := -0.01
var speed := 0.1

func _physics_process(delta):
	if Input.is_action_pressed("forward"):
		velocity += transform.basis.z * speed
	elif Input.is_action_pressed("backward"):
		velocity -= transform.basis.z * speed
	elif Input.is_action_pressed("right"):
		velocity -= transform.basis.x * speed
	elif Input.is_action_pressed("left"):
		velocity += transform.basis.x * speed
	elif Input.is_action_pressed("up"):
		velocity += transform.basis.y * speed
	elif Input.is_action_pressed("down"):
		velocity -= transform.basis.y * speed
	else:
		velocity.move_toward(Vector3.ZERO,delta)
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	move_and_slide()

func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(event.relative.x * sensitivity)
		cam.rotate_x(event.relative.y * -sensitivity)
		cam.rotation_degrees.x = clamp(cam.rotation_degrees.x,-30.0,30.0)
	
