extends Node3D

var timer_tick = 0

@onready var viewport:SubViewportContainer = $SubViewportContainer 


func _on_timer_timeout():
	timer_tick += 1
	var pixeled = max(1, timer_tick - Global.score)
	var color = min(8, 8 - (timer_tick - Global.score))
	viewport.material.set("shader_parameter/target_color_depth", color)
	viewport.material.set("shader_parameter/target_resolution_scale", pixeled)
	
	print(color)
	
	if color == 0 :
		get_tree().change_scene_to_file("res://Scenes/Death/Death.tscn")
