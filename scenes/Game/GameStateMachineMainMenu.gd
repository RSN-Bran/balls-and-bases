extends State

var gameNode
var matchScene = load("res://scenes/Match/Match.tscn")
var matchInstance

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	gameNode = owner.owner
	pass # Replace with function body.
	
func _enter_state():
	if matchInstance != null:
		matchInstance.queue_free()
	SignalBus.emit_signal("_display_menu", Constants.MENU_TYPE.MAIN_MENU)
	pass
	
func _exit_state():
	matchInstance = matchScene.instantiate()
	owner.add_child(matchInstance)
	owner.move_child(owner.get_node("Players"), -1)
	owner.move_child(owner.menuContainer, -1)
	SignalBus.emit_signal("_display_menu", Constants.MENU_TYPE.NONE)
	pass
