extends Node2D

@export var playerNum = 0
var player
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = Global.get_player(playerNum)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var color = null
	if "color" in player:
		color = player.color
	else:
		Vector3(0,0,0)
	$Sprite.material.set_shader_parameter("rgb", color)
	pass


func _on_area_2d_area_entered(area: Area2D) -> void:
	var ball = area.get_parent()
	ball.queue_free()
	player.score += ball.worth
	pass # Replace with function body.
