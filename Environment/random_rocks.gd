extends Sprite3D

@export var textures:Array

# Called when the node enters the scene tree for the first time.
func _ready():
	
	rotation_degrees.z = randi() % 10
	var new_scale = 1 - ((randf() / 2) - 0.25)
	scale = Vector3(new_scale,new_scale,new_scale)

	set_texture(textures[randi() % textures.size()])
