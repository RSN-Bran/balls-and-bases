extends Node2D

var ballScene = load("res://scenes/Ball/Ball.tscn")

@export var spawnChance = 10

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var checkSpawn = randi_range(1,1000)
	if checkSpawn <= spawnChance:
		spawn_ball()
	pass

func spawn_ball():
	var ballInstance = ballScene.instantiate()
	add_child(ballInstance)
	var randDir = randi_range(1,4)
	if randDir == 1:
		ballInstance.initSpeed = Vector2(1,0)
	elif randDir == 2:
		ballInstance.initSpeed = Vector2(-1,0)
	elif randDir == 3:
		ballInstance.initSpeed = Vector2(0,1)
	elif randDir == 4:
		ballInstance.initSpeed = Vector2(0,-1)
	ballInstance.initGlobalPosition=global_position
	ballInstance._ready()
	pass
