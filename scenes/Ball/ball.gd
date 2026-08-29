extends CharacterBody2D

var speed = 10
@export var initSpeed = Vector2(0,0)
@export var initGlobalPosition = Vector2(0,0)

var worth = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	velocity = initSpeed*speed
	if initGlobalPosition != Vector2(0,0):
		global_position=initGlobalPosition
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	move_and_slide()
	pass

func changeDirection(dir):
	velocity = dir*speed
	
