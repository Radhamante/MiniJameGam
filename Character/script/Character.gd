extends CharacterBody3D

class_name character

var speed = 0.0
var direction = 1
const MAX_SPEED = 10.0
const ACCELERATION = 0.5
const FRICTION = 0.15
const JUMP_VELOCITY = 13

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta 


	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	if Input.is_action_pressed("move_right"):
		look_at(position + Vector3.MODEL_FRONT)
		velocity.z = max(velocity.z - ACCELERATION, -MAX_SPEED)
	elif Input.is_action_pressed("move_left"):
		look_at(position + Vector3.MODEL_REAR)
		velocity.z = min(velocity.z + ACCELERATION, MAX_SPEED)
	else:
		velocity.z = lerp(velocity.z, 0.0, FRICTION)

	move_and_slide()
