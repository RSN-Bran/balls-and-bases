extends Node

var set
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_back_pressed() -> void:
	get_parent().get_node("MainMenu").show()
	get_parent().get_node("SettingsMenu").hide()
	pass # Replace with function body.
