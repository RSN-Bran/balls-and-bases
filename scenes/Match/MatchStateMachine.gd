extends StateMachine

func _ready():
	var stateMachine = StateMachine.new()
	stateMachine.add_state("ChooseMap", $ChooseMap)
	stateMachine.add_state("Playing", $Playing)
	stateMachine.add_state("BetweenGames", $BetweenGames)
	stateMachine.add_state("GameEnd", $GameEnd)
	
	if Global.gameNode.gameSettings.get_game_setting_value("stageSelection") == "Choose":
		stateMachine.call_deferred("set_state", stateMachine.states.ChooseMap)
	else:
		stateMachine.call_deferred("set_state", stateMachine.states.Playing)
	owner.stateMachine=stateMachine
