extends HBoxContainer

@export var settingKey = ""

var currentSettings
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	currentSettings = Global.gameNode.gameSettings.get_game_setting(settingKey)
	$ColorRect/Label.text = currentSettings["settingName"]
	check_arrows()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$ColorRect/Value.text = str(currentSettings.get_current_setting())
	
	pass


func _on_decrement_pressed() -> void:
	currentSettings.increment_game_setting(-1)
	check_arrows()
	pass # Replace with function body.


func _on_increment_pressed() -> void:
	currentSettings.increment_game_setting(1)
	check_arrows()
	pass # Replace with function body.

func check_arrows() -> void:
	if currentSettings.currentValueIndex == 0:
		$ColorRect/ArrowLeft.modulate.a = .5
	else:
		$ColorRect/ArrowLeft.modulate.a = 1
		
	if currentSettings.currentValueIndex == currentSettings.possibleValues.size()-1:
		$ColorRect/ArrowRight.modulate.a = .5
	else:
		$ColorRect/ArrowRight.modulate.a = 1
	


func _on_focus_entered() -> void:
	$ColorRect.color = Color(.5, .5, .5, 1)
	pass # Replace with function body.


func _on_focus_exited() -> void:
	$ColorRect.color = Color(0, 0, 0, 1)
	pass # Replace with function body.


func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventJoypadButton and event.pressed:
		if event.button_index == 14:
			_on_increment_pressed()
		elif event.button_index == 13:
			_on_decrement_pressed()
	pass # Replace with function body.
