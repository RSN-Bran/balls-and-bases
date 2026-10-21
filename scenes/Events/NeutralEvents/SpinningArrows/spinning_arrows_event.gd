extends Event
class_name SpinningArrowsEvent


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func start_event() -> void:
	$SpinTimer.start()
	$EventEndTimer.start()
	
func end_event() -> void:
	super()

func _on_event_end_timer_timeout() -> void:
	end_event()
	pass # Replace with function body.


func _on_spin_timer_timeout() -> void:
	SignalBus.emit_signal("_rotate_all_arrows", 90)
	pass # Replace with function body.
