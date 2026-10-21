extends Node
class_name Settings

var settings = {}
func set_game_settings(key, index):
	settings[key]["currentValue"]=settings[key]["possibleValues"][index]
	
func get_all_game_settings():
	return settings

func get_game_setting_value(key):
	return settings[key].get_current_setting()

func get_game_setting(key):
	return settings[key]


	
func add_setting(key, name, possibleValues, currentValueIndex):
	settings[key] = Setting.new(name, possibleValues, currentValueIndex)
	pass
