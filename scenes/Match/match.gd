extends Node

var matchTime


# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	pass # Replace with function body.


func start_match():
	$Timer.wait_time = matchTime
	$Timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	
	get_tree().quit()
	pass # Replace with function body.
