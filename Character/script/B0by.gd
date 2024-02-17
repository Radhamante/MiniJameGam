extends CharacterBody3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	get_node("Head").position = get_node("Armature/Skeleton3D/BobyHead_Locator").position
	move_and_slide()
	
	
