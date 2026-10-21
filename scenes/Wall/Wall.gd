extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_area_entered(area: Area2D) -> void:
	var tile = area.get_parent().get_parent()
	if(area.name=="RightDetector"):
		tile.addWall(Vector2(1,0))
	elif(area.name=="LeftDetector"):
		tile.addWall(Vector2(-1,0))
	elif(area.name=="UpDetector"):
		tile.addWall(Vector2(0,-1))
	elif(area.name=="DownDetector"):
		tile.addWall(Vector2(0,1))
	pass # Replace with function body.
