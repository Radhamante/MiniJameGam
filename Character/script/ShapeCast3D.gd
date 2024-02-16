extends ShapeCast3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event.is_action("left_click") and is_colliding():
		get_collider(0).hit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
