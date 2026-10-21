extends Event
class_name SpeedDownEvent


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func start_event() -> void:
	var modifier = .5
	Global.globalSpeedModifier=modifier
	SignalBus.emit_signal("_set_mover_speed_modifier", modifier)
	$Timer.start()

func end_event() -> void:
	var modifier = 1
	Global.globalSpeedModifier=modifier
	SignalBus.emit_signal("_set_mover_speed_modifier", modifier)
	super()



func _on_timer_timeout() -> void:
	end_event()
	pass # Replace with function body.
