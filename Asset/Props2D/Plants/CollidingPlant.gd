extends Node3D

@onready var plantanim = $AnimationPlayer
@onready var sprite_3d = $Node3D/Sprite3D

@export var sprite : Sprite3D
@export var textures:Array

# Called when the node enters the scene tree for the first time.
func _ready():
	
	sprite_3d.rotation_degrees.z = randi() % 10
	var new_scale = 1 - ((randf() / 2) - 0.25)
	sprite_3d.scale = Vector3(new_scale,new_scale,new_scale)
	
	sprite_3d.set_texture(textures[randi() % textures.size()])

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass


func _on_area_3d_body_entered(body):
	plantanim.play("Ruffle")
	pass # Replace with function body.


func _on_area_3d_body_exited(body):
	plantanim.play("Ruffle")
	pass # Replace with function body.
