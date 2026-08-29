extends Node

var gameNode
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	gameNode = get_node("/root/Game")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func get_player(player_num: int):
	var players = get_node("/root/Game/Players").get_children()
	for player in players:
		if player.playerNum == player_num:
			return player
	return null
	
func set_game_settings(key, value):
	gameNode.set_game_settings(key, value)
	
func get_game_settings():
	return gameNode.get_game_settings()
