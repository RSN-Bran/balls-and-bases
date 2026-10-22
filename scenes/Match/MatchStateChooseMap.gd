extends State


func _enter_state():
	SignalBus.emit_signal("_display_menu", Constants.MENU_TYPE.MAP_SELECT)
	owner.get_node("GameHUD").hide()
	owner.get_node("BetweenGamesHud").hide()
	pass
	
func _exit_state():
	SignalBus.emit_signal("_display_menu", Constants.MENU_TYPE.NONE)
	pass
