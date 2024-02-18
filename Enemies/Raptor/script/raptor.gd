extends CharacterBody3D

@onready var player: Node3D = get_node("/root/Level/B0by")
@onready var anim = $AnimatedSprite3D

@onready var fear_sounds = $Sounds/Fear
@onready var dead_sounds = $Sounds/Dead

const MAX_SPEED = 6.0
const ACCELERATION = 0.5
const FRICTION = 0.15
var is_dead = false
var is_fear = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _physics_process(delta):
	# Add the gravity.
	position.x = 0
	if is_dead:
		return
	if not is_on_floor():
		velocity.y -= gravity * delta 
	if  global_position.distance_to(player.global_position) < 15.0:
		
		# Fear
		if not is_fear:
			is_fear = true
			anim.play("Run")
			play_random_fear()
		
		# Direction
		if global_position.z < player.global_position.z:
			look_at(position + Vector3.MODEL_FRONT)
			velocity.z = max(velocity.z - ACCELERATION, -MAX_SPEED)
			get_node("AnimatedSprite3D").flip_h = false
		elif global_position.z > player.global_position.z:
			look_at(position + Vector3.MODEL_REAR)
			velocity.z = min(velocity.z + ACCELERATION, MAX_SPEED)
			get_node("AnimatedSprite3D").flip_h = true
	else:
		is_fear = false
		velocity.z = lerp(velocity.z, 0.0, FRICTION)
		anim.play("Iddle")
	move_and_slide()

func hit():
	Global.score += 1
	play_random_death()
	is_dead = true
	get_node("AnimatedSprite3D").visible = false
	get_node("Collision_ground").disabled = true
	get_node("dino").visible = true
	
func play_random_fear():
	var sound: AudioStreamPlayer3D = fear_sounds.get_child(randi() % fear_sounds.get_child_count())
	sound.play()
	
func play_random_death():
	var sound: AudioStreamPlayer3D = dead_sounds.get_child(randi() % dead_sounds.get_child_count())
	sound.play()
