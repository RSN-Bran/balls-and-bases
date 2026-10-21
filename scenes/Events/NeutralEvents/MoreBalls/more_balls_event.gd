extends Event
class_name MoreBallsEvent


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func start_event():
	SignalBus.emit_signal("_set_spawner_modifier", 3)
	var newSpawnRates: Array[SpawnRate] = [SpawnRate.New(Constants.BALL_TYPE.STANDARD_BALL, 100)]
	SignalBus.emit_signal("_set_spawner_rates", newSpawnRates)
	$Timer.start()
	
func end_event():
	SignalBus.emit_signal("_set_spawner_modifier", 1)
	var newSpawnRates: Array[SpawnRate] = [
		SpawnRate.New(Constants.BALL_TYPE.STANDARD_BALL, 96),
		SpawnRate.New(Constants.BALL_TYPE.GOLD_BALL, 2),
		SpawnRate.New(Constants.BALL_TYPE.SPIKE_BALL, 2)
	]
	SignalBus.emit_signal("_set_spawner_rates", newSpawnRates)
	super()


func _on_timer_timeout() -> void:
	end_event()
	pass # Replace with function body.
