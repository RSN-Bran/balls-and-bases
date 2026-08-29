extends CharacterBody2D

var selectedTile
var controlledTiles = []

const SPEED = 200.0

@export var playerNum = 0
@export var color = Vector3(1,0,0)
@export var startingPos = Vector2(0,0)
@export var inputNum = 0

var score=0
var direction = Vector2(0,0)

var currentTileCoords

func _ready():
	position=startingPos
func _physics_process(delta: float) -> void:
		# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	

	if direction:
		velocity = Vector2(direction.x*SPEED, direction.y*SPEED)
	else:
		velocity=Vector2(0,0)

	move_and_slide()
	
	$ArrowSprite.material.set_shader_parameter("rgb", color)
	
func process_input_press_event(event):
	
		
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
			move_to_next_tile(Vector2(0,-1))
		elif Input.is_action_just_pressed("Move Left"):
			move_to_next_tile(Vector2(-1,0))
		elif Input.is_action_just_pressed("Move Down"):
			move_to_next_tile(Vector2(0,1))
		elif Input.is_action_just_pressed("Move Right"):
			move_to_next_tile(Vector2(1,0))

func process_input_release_event(event):
	direction = Input.get_vector("Joystick Left", "Joystick Right", "Joystick Up", "Joystick Down")
	pass
			
func setArrow(direction):
	var addToList = selectedTile.setArrow(direction, self)
	if addToList == true:
		controlledTiles.append(selectedTile)
		if controlledTiles.size() > Global.get_game_settings()["maxTilesPerPlayer"]:
			controlledTiles[0].removeArrow()
			controlledTiles.pop_front()

func _on_area_2d_area_entered(area: Area2D) -> void:
	selectedTile=area.get_parent()
	area.get_parent().displaySelector()
	currentTileCoords = selectedTile.coords

func _on_area_2d_area_exited(area: Area2D) -> void:
	selectedTile=null
	area.get_parent().hideSelector()
	
func move_to_next_tile(dir):

	var tempNewCoords = currentTileCoords+dir
	if tempNewCoords.x < 1 or tempNewCoords.y < 1 or tempNewCoords.x > 11 or tempNewCoords.y > 11:
		return
	currentTileCoords = currentTileCoords+dir
	global_position = currentTileCoords*16
	
	pass
	
