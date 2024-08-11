extends Camera3D

const RAY_LENGTH = 1000

func _process(delta):
	var result = _get_contact_info()
	if result:
		if result.collider.has_method("collect"):
			if Input.is_action_just_pressed("shoot"):
				result.collider.collect()
		elif result.collider.has_method("repair"):
			if Input.is_action_just_pressed("shoot"):
				result.collider.repair()
		elif result.collider.has_method("destroy"):
			if Input.is_action_just_pressed("shoot"):
				result.collider.destroy()

func _get_contact_info():
	var _space_state : PhysicsDirectSpaceState3D = get_world_3d().direct_space_state
	var _mouse_pos : Vector2 = get_viewport().get_mouse_position()
	var _from : Vector3 = project_ray_origin(_mouse_pos)
	var _to : Vector3 = _from + project_ray_normal(_mouse_pos)*RAY_LENGTH
	var _ray_query := PhysicsRayQueryParameters3D.create(_from,_to)
	var result : Dictionary = _space_state.intersect_ray(_ray_query)
	return result
