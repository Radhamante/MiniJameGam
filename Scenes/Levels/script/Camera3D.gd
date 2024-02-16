extends Camera3D

@export var target: Node3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position.z = target.global_position.z
	global_position.y = target.global_position.y + 1
	pass
