extends Event
class_name FreezeEvent

@onready var timer:Timer = $Timer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func start_event():
	timer.start()
	SignalBus.emit_signal("_freeze_unfreeze", [
		Constants.MATCH_COMPONENT_BALLS,
		Constants.MATCH_COMPONENT_TIMER
	], true)

func end_event() -> void:
	SignalBus.emit_signal("_freeze_unfreeze", [
		Constants.MATCH_COMPONENT_BALLS,
		Constants.MATCH_COMPONENT_TIMER
	], false)
	super()
	
func _on_timer_timeout() -> void:
	end_event()
	pass # Replace with function body.
