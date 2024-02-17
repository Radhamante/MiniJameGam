extends CharacterBody3D

class_name character

var speed = 0.0
var direction = 1
const MAX_SPEED = 10.0
const ACCELERATION = 0.5
const FRICTION = 0.15
const JUMP_VELOCITY = 13
var timer: Timer


@onready var animation_tree = $AnimationTree
@onready var state_machine = animation_tree.get("parameters/playback")

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():	
	timer = Timer.new()
	timer.set_wait_time(10) # 5 seconds wait time
	timer.set_one_shot(true)
	add_child(timer)
	timer.timeout.connect(dance)
	timer.start()

func dance():
	animation_tree.set("parameters/conditions/dancing", true)
	print("DANCE")

func _input(event):
	animation_tree.set("parameters/conditions/dancing", false)
	if event.is_action("left_click") && is_on_floor():
		animation_tree.set("parameters/conditions/attack", true)
	else:
		
		animation_tree.set("parameters/conditions/attack", false)

func _physics_process(delta):
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta 
	
	# Is idle
	if is_on_floor() and velocity.z == 0:
		animation_tree.set("parameters/conditions/idle", true)
		if timer.is_stopped() : timer.start()
	else:
		timer.stop()
		animation_tree.set("parameters/conditions/idle", false)

	if state_machine.get_current_node() == "Hit":
		velocity.z = 0
	else:
		# Handle jump.
		if Input.is_action_just_pressed("jump") and is_on_floor():
			animation_tree.set("parameters/conditions/jumping", true)
			velocity.y = JUMP_VELOCITY
		else:
			animation_tree.set("parameters/conditions/jumping", false)
		
		# Handle move
		if Input.is_action_pressed("move_right"):
			animation_tree.set("parameters/conditions/running", true)
			look_at(position + Vector3.MODEL_FRONT)
			velocity.z = max(velocity.z - ACCELERATION, -MAX_SPEED)
		elif Input.is_action_pressed("move_left"):
			animation_tree.set("parameters/conditions/running", true)
			look_at(position + Vector3.MODEL_REAR)
			velocity.z = min(velocity.z + ACCELERATION, MAX_SPEED)
		else:
			animation_tree.set("parameters/conditions/running", false)
			velocity.z = lerp(velocity.z, 0.0, FRICTION)
			if velocity.z < 0.1:
				velocity.z = 0
	position.x = 0
	move_and_slide()
