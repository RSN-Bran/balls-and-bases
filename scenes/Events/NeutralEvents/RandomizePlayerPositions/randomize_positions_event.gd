extends Event
class_name RandomizePositionsEvent


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func start_event():
	SignalBus.emit_signal("_randomize_player_positions")
	end_event()
	
func end_event():
	super()
