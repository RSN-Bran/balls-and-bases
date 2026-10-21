extends CanvasLayer

var timerNode
# Called when the node enters the scene tree for the first time.*
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if timerNode == null:
		timerNode = get_parent().get_node("MatchTimer")
	var totalSeconds = int(ceil(get_parent().get_node("MatchTimer").time_left))
	var minutes = floor(totalSeconds / 60)
	var seconds = totalSeconds - (minutes*60)
	$Timer/Label.text = str(minutes)+":"+(str(seconds) if seconds >= 10 else ("0"+str(seconds)))
	pass
