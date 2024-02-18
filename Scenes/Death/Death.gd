extends Control


func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/Level.tscn")


func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://MainMenu/Level/MainMenu.tscn")
	pass # Replace with function body.
