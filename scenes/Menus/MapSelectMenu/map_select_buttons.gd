extends VBoxContainer

var mapSelectButtonScene: PackedScene = load("res://scenes/Menus/MapSelectMenu/MapSelectButton.tscn")
var buttons = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for map in Constants.maps:
		var buttonScene = mapSelectButtonScene.instantiate()
		buttonScene.map=map
		buttonScene.text=map.mapName
		add_child(buttonScene)
		buttons.append(buttonScene)
	buttons[0].grab_focus()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func test(num: int):
	print("map")
