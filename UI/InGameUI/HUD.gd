extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$CanvasLayer/BackUiScore/Label.text = str(Global.score)
	$CanvasLayer/TextureProgressBar.value = (Global.color)
	pass
