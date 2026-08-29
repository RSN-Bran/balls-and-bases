extends Control

@export var playerNum = 0
var player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = Global.get_player(playerNum)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Score.text = str(player.score)
	$ColorRect.material.set_shader_parameter("rgb", player.color)
	pass
