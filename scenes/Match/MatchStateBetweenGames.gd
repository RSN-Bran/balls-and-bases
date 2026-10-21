extends State

func _enter_state():
	pass

func _exit_state():
	SignalBus.emit_signal("_display_menu", Constants.MENU_TYPE.NONE)
	pass
