extends Node

@onready var movers: Node2D = $Movers
@onready var timer: Timer = $MatchTimer
@onready var pauseFadeLayer: ColorRect = $GameHUD/PauseFadeLayer
@onready var eventHandler = $EventHandler
@onready var gameHud = $GameHUD

var betweenGamesHud: PackedScene = load("res://scenes/BetweenGamesHUD/BetweenGamesHUD.tscn")

var matchTime
var currentState
var players
var mapInstance: PlayMap
var currentlyPaused: bool = false

var stateMachine
var recentWinner=null

var matchComponentDict: Dictionary = {}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalBus.connect("_pause_unpause", pause_unpause)
	SignalBus.connect("_freeze_unfreeze", freeze_unfreeze)
	SignalBus.connect("_spawn_mover", spawn_mover)
	SignalBus.connect("_choose_map", choose_map)
	
	pauseFadeLayer.hide()
	players = [
		Global.get_player(1),
		Global.get_player(2),
		Global.get_player(3),
		Global.get_player(4)
	]
	
	matchComponentDict[Constants.MATCH_COMPONENT_BALLS] = movers
	matchComponentDict[Constants.MATCH_COMPONENT_TIMER] =timer

	pass # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Start") and stateMachine.state==stateMachine.states.BetweenGames and recentWinner.wins >= Global.gameNode.gameSettings.get_game_setting_value("firstToWins"):
		SignalBus.emit_signal("_set_game_state", Constants.GAME_STATE_MAIN_MENU)
	if Input.is_action_just_pressed("Start") and stateMachine.state==stateMachine.states.BetweenGames:
		stateMachine.set_state(stateMachine.states.Playing)
	elif Input.is_action_just_pressed("Start"):
		pause_unpause()

func _on_timer_timeout() -> void:
	stateMachine.set_state(stateMachine.states.BetweenGames)

func change_state(newState: String):
	var stateNode = get_node("MatchStateMachine").get_node(newState)
	if stateNode != null:
		currentState=stateNode	

func pause_unpause():
	var pauseGame = currentlyPaused == false
	if pauseGame:
		SignalBus.emit_signal("_display_menu", Constants.MENU_TYPE.PAUSE_MENU)
		pauseFadeLayer.show()
	else:
		SignalBus.emit_signal("_display_menu", Constants.MENU_TYPE.NONE)
		pauseFadeLayer.hide()
	freeze_unfreeze(null, pauseGame)
	currentlyPaused = !currentlyPaused
	
func freeze_unfreeze(componentIdsToFreeze, freeze: bool) -> void:
	var process_mode
	if freeze == true:
		process_mode = PROCESS_MODE_DISABLED
	else:
		process_mode = PROCESS_MODE_INHERIT
	if componentIdsToFreeze == null:
		self.process_mode=process_mode
	else:
		for componentId in componentIdsToFreeze:
			matchComponentDict[componentId].process_mode=process_mode
	
func spawn_mover(mover: Mover):
	movers.add_child(mover)
	
func clear_movers() -> void:
	var allMovers = movers.get_children()
	for mover in allMovers:
		mover.queue_free()
		
func choose_map(map: PlayMap):
	self.mapInstance=map
	stateMachine.set_state(stateMachine.states.Playing)
	pass
