extends Node3D

@export var patterns: Array
@export var player: Node3D

const PATTERN_SIZE = 64
var current_pose = 0

func generate_limits(pattern):
	#SHAPE
	var shape = BoxShape3D.new()
	shape.size = Vector3(1,10,1)
	#COLLISON
	var collision = CollisionShape3D.new()
	collision.shape = shape
	#AREA
	var limit:Area3D = Area3D.new()
	limit.collision_mask = 4
	limit.position = Vector3(0,5,1)
	
	#CALLBACK
	var on_body_enter = func(a):
		limit.queue_free()
		print(a)
		add_pattern()
	
	limit.body_entered.connect(on_body_enter)
	
	limit.add_child(collision)
	pattern.add_child(limit)

func add_pattern():
	var pattern_scene:PackedScene = patterns[randi() % patterns.size()]
	var scene:Node3D = pattern_scene.instantiate()
	scene.position = Vector3(0,0,current_pose * 64)
	current_pose += 1
	generate_limits(scene)
	add_child(scene)

# Called when the node enters the scene tree for the first time.
func _ready():
	var dir = DirAccess.open("res://Patterns/")
	print(dir)
	add_pattern()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
