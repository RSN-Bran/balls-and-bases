extends Node
class_name Setting

var settingName
var possibleValues
var currentValueIndex

func _init(settingName, possibleValues, currentValueIndex):
	self.settingName=settingName
	self.possibleValues=possibleValues
	self.currentValueIndex=currentValueIndex
	pass

func get_current_setting():
	return self.possibleValues[self.currentValueIndex]
	
func increment_game_setting(inc):
	var tempIndex = self.currentValueIndex + inc
	if tempIndex >= 0 and tempIndex < self.possibleValues.size():
		self.currentValueIndex = tempIndex
