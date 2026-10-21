extends Node

var controller_map : Dictionary[int, CharacterBody2D] = {}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	controller_map = {
		0: $Player1,
		1: $Player2,
		2: $Player3,
		3: $Player4
	}


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _input(event: InputEvent) -> void:
	if event.device > 4:
		return
	if event.is_pressed():
		controller_map[event.device].process_input_press_event(event)
	elif event.is_released():
		controller_map[event.device].process_input_release_event(event)
	pass
