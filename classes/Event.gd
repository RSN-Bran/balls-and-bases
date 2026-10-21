extends Node
class_name Event

@export var eventName: String = ""

static func new_event(eventScene: PackedScene) -> Event:
	if eventScene == null:
		return
	var instantiatedScene = eventScene.instantiate()
		
	return instantiatedScene
	
func start_event():
	pass

func end_event():
	SignalBus.emit_signal("_end_event")
	pass
