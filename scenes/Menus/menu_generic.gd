extends Control

@onready var menuLabel: Label = $MenuLabel
@onready var vBox: VBoxContainer = $CenterContainer/VBoxContainer
@export var menuName: String = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var buttons = $CenterContainer/VBoxContainer.get_children()
	if buttons.size() > 0:
		buttons[0].grab_focus()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	menuLabel.text = menuName
	pass


func _on_back_pressed() -> void:
	SignalBus.emit_signal("_display_menu", Constants.MENU_TYPE.PREVIOUS)
	pass # Replace with function body.


func _on_play_pressed() -> void:
	SignalBus.emit_signal("_display_menu", Constants.MENU_TYPE.MATCH_SETTINGS)
	pass # Replace with function body.


func _on_settings_pressed() -> void:
	SignalBus.emit_signal("_display_menu", Constants.MENU_TYPE.GAME_SETTINGS)
	pass # Replace with function body.


func _on_quit_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.


func _on_start_match_pressed() -> void:
	SignalBus.emit_signal("_set_game_state", Constants.GAME_STATE_IN_GAME)
	pass # Replace with function body.


func _on_resume_pressed() -> void:
	SignalBus.emit_signal("_pause_unpause")
	pass # Replace with function body.


func _on_quit_match_pressed() -> void:
	SignalBus.emit_signal("_set_game_state", Constants.GAME_STATE_MAIN_MENU)
	pass # Replace with function body.
