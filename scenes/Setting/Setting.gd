extends Node

@export var possibleValues = [0]
@export var settingKey = ""
var index = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label.text = settingKey
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Value.text = str(possibleValues[index])
	pass


func _on_decrement_pressed() -> void:
	if index > 0:
		index -= 1
	Global.set_game_settings(settingKey, possibleValues[index])
	pass # Replace with function body.


func _on_increment_pressed() -> void:
	if index < possibleValues.size()-1:
		index += 1
	Global.set_game_settings(settingKey, possibleValues[index])
	pass # Replace with function body.
