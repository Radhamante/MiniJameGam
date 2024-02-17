extends Node3D

@onready var SpritePlante = $Node3D
@onready var plantanim = $AnimationPlayer
@export var sprite : Sprite3D
@onready var sprite_3d = $Node3D/Sprite3D
var dir = DirAccess.open("res://Asset/Props2D/Plants/PlantsSprite/")

# Called when the node enters the scene tree for the first time.
func _ready():
	
	if dir:
		var file_name = dir.get_files()[(randi() % (dir.get_files().size() / 2) * 2)]
		print(file_name)
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
