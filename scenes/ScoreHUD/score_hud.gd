extends MarginContainer

@export var playerNum = 0
var player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = Global.get_player(playerNum)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$VBoxContainer/Name.text = str(player.playerName)
	$VBoxContainer/Score.text = str(player.score)
	$ColorRect.color=Color(player.color.x,player.color.y,player.color.z, 1)
	pass
