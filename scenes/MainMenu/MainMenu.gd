extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass


func _on_button_pressed() -> void:
	Global.gameNode.create_match()
	pass # Replace with function body.


func _on_quit_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.


func _on_settings_pressed() -> void:
	get_parent().get_node("MainMenu").hide()
	get_parent().get_node("SettingsMenu").show()
	pass # Replace with function body.
