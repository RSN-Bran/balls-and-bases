extends StateMachine

var stateMachine: StateMachine
func _ready():
	SignalBus.connect("_set_game_state", set_state)
	stateMachine = StateMachine.new()
	stateMachine.add_state(Constants.GAME_STATE_IN_GAME, $InGame)
	stateMachine.add_state(Constants.GAME_STATE_MAIN_MENU, $MainMenu)
	stateMachine.call_deferred("set_state", stateMachine.states[Constants.GAME_STATE_MAIN_MENU])
	owner.stateMachine=stateMachine

func set_state(state: int):
	var newStateNode = stateMachine.states[state]
	stateMachine.call_deferred("set_state", newStateNode)
