extends Camera3D

@export var target: Node3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position.z = target.global_position.z
	global_position.y = target.global_position.y + 1
	shoot_ray()
	pass
	
func shoot_ray():
	var mouse_position = get_viewport().get_mouse_position()
	var ray_length = 100
	var from = project_ray_origin(mouse_position)
	var to = from + project_ray_normal(mouse_position) * ray_length
	var space = get_world_3d().direct_space_state
	var ray_query = PhysicsRayQueryParameters3D.new()
	ray_query.from = from
	ray_query.to = to
	var raycast_result = space.intersect_ray(ray_query)
	if !raycast_result.is_empty():
		var look_direction = Vector3(raycast_result["position"])
		look_direction.x = 0
		var head_rotate = target.get_node("Armature/Skeleton3D/BoneAttachment3D2/Node3D/head_rotation_axis")

		head_rotate.look_at(look_direction)
		head_rotate.rotation_degrees.x = clamp(head_rotate.rotation_degrees.x, -29, 50)

	
	#target.get_node("SpotLight3D").
