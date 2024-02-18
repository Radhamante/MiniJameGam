extends Sprite3D

var dir = DirAccess.open("res://Environment/Sprites/")

# Called when the node enters the scene tree for the first time.
func _ready():
	
	rotation_degrees.z = randi() % 10
	var new_scale = 1 - ((randf() / 2) - 0.25)
	scale = Vector3(new_scale,new_scale,new_scale)

	if dir:
		var file_name = dir.get_files()[(randi() % (dir.get_files().size() / 2) * 2)]
		set_texture(load("res://Environment/Sprites/" + file_name))
	else:
		print("An error occurred when trying to access the path.")
