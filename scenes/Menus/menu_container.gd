extends CanvasLayer

var currentMenu: Node = null
var previousMenuId: int = Constants.MENU_TYPE.NONE
var currentMenuId: int = Constants.MENU_TYPE.NONE
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalBus.connect("_display_menu", display_menu)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func display_menu(menu_type: int):
	if menu_type == Constants.MENU_TYPE.PREVIOUS:
		display_menu(self.previousMenuId)
		return
	if currentMenu != null:
		currentMenu.queue_free()
			
	if menu_type != null and Constants.MENU_TYPES.has(menu_type):
		currentMenu = Constants.MENU_TYPES[menu_type].instantiate()
		add_child(currentMenu)
		previousMenuId=currentMenuId
		currentMenuId=menu_type
