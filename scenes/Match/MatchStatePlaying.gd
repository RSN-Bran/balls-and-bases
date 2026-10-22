extends State


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _enter_state():
	for player in owner.players:
		player.reset_for_match()
	owner.mapInstance = Constants.maps[randi_range(0, Constants.maps.size()-1)]
	owner.add_child(owner.mapInstance)
	
	
	owner.mapInstance.call_deferred("map_preparation")
	
	if Global.gameNode.gameSettings.get_game_setting_value("enableEvents") == "Yes":
		owner.eventHandler.start_event_timer()
	
	
	
	owner.matchComponentDict[Constants.MATCH_COMPONENT_MAP]=owner.mapInstance
	
	owner.matchTime = Global.gameNode.gameSettings.get_game_setting_value("matchTime")
	
	owner.get_node("BetweenGamesHud").hide()
	owner.get_node("GameHUD").show()
	owner.get_node("MatchTimer").wait_time = owner.matchTime
	owner.get_node("MatchTimer").start()
	
	
	pass
	
func _exit_state():
	owner.clear_movers()
	if Global.gameNode.gameSettings.get_game_setting_value("enableEvents") == "Yes":
		owner.eventHandler.stop_event_timer()
	var winner = null
	for player in owner.players:
		if winner == null or player.score > winner.score:
			winner = player
	winner.wins += 1
	winner.isRecentWinner=true
	owner.recentWinner = winner
	owner.mapInstance.queue_free()
	SignalBus.emit_signal("_display_menu", Constants.MENU_TYPE.BETWEEN_ROUNDS)
	owner.get_node("GameHUD").hide()
	owner.get_node("MatchTimer").stop()
	pass
