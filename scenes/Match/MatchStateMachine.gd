extends StateMachine

func _ready():
	var stateMachine = StateMachine.new()
	stateMachine.add_state("Playing", $Playing)
	stateMachine.add_state("BetweenGames", $BetweenGames)
	stateMachine.add_state("GameEnd", $GameEnd)
	stateMachine.call_deferred("set_state", stateMachine.states.Playing)
	owner.stateMachine=stateMachine
