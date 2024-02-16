extends CharacterBody3D

@export var player: Node3D

const MAX_SPEED = 6.0
const ACCELERATION = 0.5
const FRICTION = 0.15

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta 
	if position.distance_to(player.position) < 15.0:
		if global_position.z < player.global_position.z:
			look_at(position + Vector3.MODEL_FRONT)
			velocity.z = max(velocity.z - ACCELERATION, -MAX_SPEED)
		elif global_position.z > player.global_position.z:
			look_at(position + Vector3.MODEL_REAR)
			velocity.z = min(velocity.z + ACCELERATION, MAX_SPEED)
		print(velocity.z)
	else:
		velocity.z = lerp(velocity.z, 0.0, FRICTION)

	move_and_slide()
