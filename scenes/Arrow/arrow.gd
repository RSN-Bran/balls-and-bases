extends Node2D

var arrowDir
var owningPlayer
var tile

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	tile = get_parent()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func setArrow(arrowDir_param, owningPlayer_param):
	arrowDir=arrowDir_param
	owningPlayer=owningPlayer_param
	$ArrowSprite.rotation_degrees=arrowDir
	$ArrowSprite.material.set_shader_parameter("rgb", owningPlayer.color)


func _on_area_2d_area_entered(area: Area2D) -> void:
	var ball = area.get_parent()
	var newDir
	if arrowDir==0:
		newDir=Vector2(0,-1)
	elif arrowDir==90:
		newDir=Vector2(1,0)
	elif arrowDir == 180:
		newDir=Vector2(0,1)
	else:
		newDir=Vector2(-1,0)
	ball.changeDirection(newDir)
	pass # Replace with function body.
