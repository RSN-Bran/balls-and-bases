extends Node

@onready var menuContainer = $MenuContainer
@onready var gameSettings = Settings.new()

var stateMachine

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	gameSettings.add_setting("matchTime", "Match Timer", [30, 60, 90, 180, 270], 3)
	gameSettings.add_setting("firstToWins", "First To Wins", [1,2,3,4,5], 0)
	gameSettings.add_setting("maxTilesPerPlayer", "Max Tiles Per Player", [1,2,3,4,5], 2)
	gameSettings.add_setting("enableEvents", "Enable Events", ["Yes", "No"], 0)
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func pause_game() -> void:
	pass
	
