extends CharacterBody2D

var selectedTile
var controlledTiles = []

const SPEED = 200.0

@export var playerNum = 0
@export var color = Vector3(1,0,0)
@export var startingPos = Vector2(0,0)
@export var inputNum = 0
@export var soundEffectPitchOffset: float = 1

var playerName
var score=0
var wins=0
var direction = Vector2i(0,0)
var isRecentWinner = false

var currentTileCoords

func _ready():
	position=startingPos
	playerName = "Player " + str(playerNum)
	
	
func _physics_process(delta: float) -> void:
	
	if Global.gameNode.get_node("GameStateMachine").stateMachine.state == Global.gameNode.get_node("GameStateMachine").stateMachine.states[Constants.GAME_STATE_IN_GAME]:
		$ArrowSprite.show()
	else:
		$ArrowSprite.hide()
		# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	

	if direction:
		velocity = Vector2(direction.x*SPEED, direction.y*SPEED)
	else:
		velocity=Vector2(0,0)

	move_and_slide()
	
	$ArrowSprite.material.set_shader_parameter("rgb", color)
	
	if global_position.x < 0:
		global_position.x = 0
	elif global_position.x > Constants.PIXEL_DIMENSIONS.x:
		global_position.x = Constants.PIXEL_DIMENSIONS.x
	
	var dimensions = ["x", "y"]
	for dimension in dimensions:
		if global_position[dimension] < 0:
			global_position[dimension] = 0
		elif global_position[dimension] > Constants.PIXEL_DIMENSIONS[dimension]:
			global_position[dimension] = Constants.PIXEL_DIMENSIONS[dimension]
	
func process_input_press_event(event: InputEvent):
	
	if Global.gameNode.get_node("GameStateMachine").stateMachine.state == Global.gameNode.get_node("GameStateMachine").stateMachine.states[Constants.GAME_STATE_IN_GAME]:
		direction = Input.get_vector("Joystick Left", "Joystick Right", "Joystick Up", "Joystick Down")
	
	if selectedTile != null:
		if Input.is_action_just_pressed("Up Arrow"):
			setArrow(0)
		elif Input.is_action_just_pressed("Right Arrow"):
			setArrow(90)
		elif Input.is_action_just_pressed("Down Arrow"):
			setArrow(180)
		elif Input.is_action_just_pressed("Left Arrow"):
			setArrow(270)
		elif Input.is_action_just_pressed("Move Up"):
			move_to_next_tile(Constants.POSSIBLE_DIRECTIONS["UP"])
		elif Input.is_action_just_pressed("Move Left"):
			move_to_next_tile(Constants.POSSIBLE_DIRECTIONS["LEFT"])
		elif Input.is_action_just_pressed("Move Down"):
			move_to_next_tile(Constants.POSSIBLE_DIRECTIONS["DOWN"])
		elif Input.is_action_just_pressed("Move Right"):
			move_to_next_tile(Constants.POSSIBLE_DIRECTIONS["RIGHT"])
		
func process_input_release_event(event):
	if Global.gameNode.get_node("GameStateMachine").stateMachine.state == Global.gameNode.get_node("GameStateMachine").stateMachine.states[Constants.GAME_STATE_IN_GAME]:
		direction = Input.get_vector("Joystick Left", "Joystick Right", "Joystick Up", "Joystick Down")
	pass
			
func setArrow(direction):
	var addToList = selectedTile.setArrow(direction, self)
	if addToList == true:
		controlledTiles.append(selectedTile)
		if controlledTiles.size() > Global.gameNode.gameSettings.get_game_setting_value("maxTilesPerPlayer"):
			controlledTiles[0].removeArrow()

func _on_area_2d_area_entered(area: Area2D) -> void:
	selectedTile=area.get_parent()
	area.get_parent().displaySelector()
	currentTileCoords = selectedTile.coords

func _on_area_2d_area_exited(area: Area2D) -> void:
	selectedTile=null
	area.get_parent().hideSelector()
	
func move_to_next_tile(dir: Vector2i):
	var tempNewCoords = currentTileCoords+dir
	if tempNewCoords.x < 1 or tempNewCoords.y < 1 or tempNewCoords.x > 11 or tempNewCoords.y > 11:
		return
	currentTileCoords = currentTileCoords+dir
	global_position = currentTileCoords*16
	
	pass
	
func reset_for_match():
	score=0
	controlledTiles = []
	isRecentWinner=false
	
