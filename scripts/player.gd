extends CharacterBody3D

@export var cam : Camera3D
var sensitivity := -0.01
var speed := 6
var is_back_menu_on := false
@onready var oxygen_progress_bar = %OxygenProgressBar
@onready var ship_health_progress_bar = %ShipHealthProgressBar


func _physics_process(delta):
	#movement in space
	if not is_on_floor():
		if Input.is_action_pressed("forward"):
			velocity += transform.basis.z * speed * delta
		elif Input.is_action_pressed("backward"):
			velocity -= transform.basis.z * speed * delta
		elif Input.is_action_pressed("right"):
			velocity -= transform.basis.x * speed * delta
		elif Input.is_action_pressed("left"):
			velocity += transform.basis.x * speed * delta
		elif Input.is_action_pressed("up"):
			velocity += transform.basis.y * speed * delta
		elif Input.is_action_pressed("down"):
			velocity -= transform.basis.y * speed * delta
			
		if not is_back_menu_on :
			oxygen_progress_bar.value -= 1 * delta
			
	#movement on ship
	else:
		if Input.is_action_pressed("forward"):
			velocity += transform.basis.z * speed * delta
		elif Input.is_action_pressed("backward"):
			velocity -= transform.basis.z * speed * delta
		elif Input.is_action_pressed("right"):
			velocity -= transform.basis.x * speed * delta
		elif Input.is_action_pressed("left"):
			velocity += transform.basis.x * speed * delta
		elif Input.is_action_pressed("up"):
			velocity += transform.basis.y * speed * delta
		else:
			velocity = Vector3.ZERO
			
		if not is_back_menu_on :
			oxygen_progress_bar.value += 5 * delta
	
	if not is_back_menu_on:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		move_and_slide()
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	if oxygen_progress_bar.value == 0 or ship_health_progress_bar.value == 0 :
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		get_tree().change_scene_to_file("res://scenes/game_over.tscn")
	

func _input(event):
	if event is InputEventMouseMotion and not is_back_menu_on:
		rotate_y(event.relative.x * sensitivity)
		cam.rotate_x(event.relative.y * -sensitivity)
		cam.rotation_degrees.x = clamp(cam.rotation_degrees.x,-30.0,30.0)
	
