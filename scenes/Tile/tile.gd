extends Node2D

var arrowScene = load("res://scenes/Arrow/Arrow.tscn")

var isSelected

var arrowInstance
var coords: Vector2i
var owningPlayer

var walls = {
	Vector2(0,-1): false, #Up
	Vector2(1,0): false, #Right
	Vector2(0,1): false, #Down
	Vector2(-1,0): false #Left
}

@export var isArrowPlaceable = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var tileMapLayer = get_parent()
	if tileMapLayer is not TileMapLayer:
		tileMapLayer = tileMapLayer.get_parent()
	coords = tileMapLayer.local_to_map(self.global_position)
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
	arrowInstance.destroy_arrow()
	
func determineSelectability():
	if isArrowPlaceable==true:
		$CursorDetector.show()
		#$CursorDetector/CollisionShape2D.disabled=false
	else:
		$CursorDetector.hide()
		#$CursorDetector/CollisionShape2D.disabled=true
		
func addWall(dir):
	walls[dir]=true
	pass

func _on_area_2d_area_entered(area: Area2D) -> void:
	
	var ball = area.get_parent()
	ball.global_position=self.global_position
	if arrowInstance != null:
		
			
		var newDir
		if arrowInstance.arrowDir==0:
			newDir=Vector2(0,-1)
		elif arrowInstance.arrowDir==90:
			newDir=Vector2(1,0)
		elif arrowInstance.arrowDir == 180:
			newDir=Vector2(0,1)
		else:
			newDir=Vector2(-1,0)
		ball.changeDirection(newDir)
		arrowInstance.lose_health(ball.damage)
	
	#Path is clear, return
	if walls[ball.direction] == false:
		return
	
	#Path not clear, pick a direction
	var perpendiculars
	if ball.direction==Vector2(0,-1) or ball.direction==Vector2(0,1):
		perpendiculars = [Vector2(1,0), Vector2(-1, 0)]
	else:
		perpendiculars = [Vector2(0,1), Vector2(0,-1)]
	
	var hasWall1 = walls[perpendiculars[0]]
	var hasWall2 = walls[perpendiculars[1]]

	if hasWall1==false and hasWall2==false:
		var rand_dir = randi_range(0,1)
		ball.changeDirection(perpendiculars[rand_dir])
	elif hasWall1==true and hasWall2==false:
		ball.changeDirection(perpendiculars[1])
	elif hasWall1==false and hasWall2==true:
		ball.changeDirection(perpendiculars[0])
		
	elif hasWall1==true and hasWall2==true:
		ball.changeDirection(ball.dir*-1)
		
		pass
	#Old Logic to always rotate 90 degrees
	#var dirIndex = dirs.find(ball.dir)
	#while true:
		#if dirIndex == dirs.size()-1:
			#dirIndex = 0
		#else:
			#dirIndex +=1
		#if walls[dirs[dirIndex]] == false:
			#ball.changeDirection(dirs[dirIndex])
			#break
	pass # Replace with function body.
