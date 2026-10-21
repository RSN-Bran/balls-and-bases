extends Event
class_name CommunismEvent

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func start_event() -> void:
	var players = Global.get_players()
	var totalScore = 0
	for player in players:
		totalScore+=player.score
		
	for player in players:
		player.score=totalScore/4
	end_event()
	pass
	
func end_event() -> void:
	super()
	
