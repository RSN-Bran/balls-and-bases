extends Node2D

var arrowScene = load("res://scenes/Arrow/Arrow.tscn")

var isSelected

var arrowInstance
var coords
var owningPlayer

@export var isArrowPlaceable = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
		
	coords = Vector2((global_position.x+8)/16, (global_position.y+8)/16)
	determineSelectability()
	
	var tileColor
	if (int(coords.x)%2==0) != (int(coords.y)%2==0):
		tileColor = Vector3(.33,.33,.33)		
	else:
		tileColor = Vector3(.66,.66,.66)
	$Tile.material.set_shader_parameter("rgb", tileColor)
			
	pass # Replace with function body.
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if isSelected==true:
		$SelectorSprite.show()
	else:
		$SelectorSprite.hide()
		
	pass

func displaySelector():
	isSelected = true
	
func hideSelector():
	isSelected = false
	
func setArrow(arrowDir_param, owningPlayer_param):
	if isArrowPlaceable==true and owningPlayer == null:
		arrowInstance = arrowScene.instantiate()
		add_child(arrowInstance)
		arrowInstance.setArrow(arrowDir_param, owningPlayer_param)
		owningPlayer = owningPlayer_param
		return true
	elif isArrowPlaceable==true and owningPlayer ==owningPlayer_param:
		arrowInstance.setArrow(arrowDir_param, owningPlayer_param)
	return false
	
func removeArrow():
	arrowInstance.queue_free()
	owningPlayer = null
	
func determineSelectability():
	if isArrowPlaceable==true:
		$CursorDetector.show()
		#$CursorDetector/CollisionShape2D.disabled=false
	else:
		$CursorDetector.hide()
		#$CursorDetector/CollisionShape2D.disabled=true
