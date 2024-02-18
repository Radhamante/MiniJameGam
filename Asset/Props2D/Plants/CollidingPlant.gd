extends Node3D

@onready var SpritePlante = $Node3D
@onready var plantanim = $AnimationPlayer
@export var sprite : Sprite3D
@onready var sprite_3d = $Node3D/Sprite3D
var dir = DirAccess.open("res://Asset/Props2D/Plants/PlantsSprite/")

# Called when the node enters the scene tree for the first time.
func _ready():
	
	sprite_3d.rotation_degrees.z = randi() % 10
	var new_scale = 1 - ((randf() / 2) - 0.25)
	sprite_3d.scale = Vector3(new_scale,new_scale,new_scale)
	
	if dir:
		var file_name = dir.get_files()[(randi() % (dir.get_files().size() / 2) * 2)]
		sprite_3d.set_texture(load("res://Asset/Props2D/Plants/PlantsSprite/" + file_name))
		
	else:
		print("An error occurred when trying to access the path.")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass


func _on_area_3d_body_entered(body):
	plantanim.play("Ruffle")
	pass # Replace with function body.


func _on_area_3d_body_exited(body):
	plantanim.play("Ruffle")
	pass # Replace with function body.
