extends Node

var matchScene = load("res://scenes/Match/Match.tscn")
var matchInstance

var gameSettings = {
	"matchTime" = 30,
	"firstToWins" = 3,
	"maxTilesPerPlayer" = 3
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Menus/SettingsMenu.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func create_match():
	matchInstance = matchScene.instantiate()
	add_child(matchInstance)
	var mapScene = load("res://scenes/Maps/Map1.tscn")
	var mapInstance = mapScene.instantiate()
	matchInstance.add_child(mapInstance)
	$Menus.queue_free()
	move_child($Players, -1)
	$Match.matchTime = gameSettings["matchTime"]
	$Match.start_match()

func set_game_settings(key, value):
	gameSettings[key]=value
	
func get_game_settings():
	return gameSettings
