extends Control

@export var playerNum = 0
var player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = Global.get_player(playerNum)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player.isRecentWinner==true:
		$HBoxContainer/WinnerIcon.show()
	else:
		$HBoxContainer/WinnerIcon.hide()
	$HBoxContainer/Player.text = str(player.playerName)
	$HBoxContainer/Wins.text = str(player.wins)
	pass
