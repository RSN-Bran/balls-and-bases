extends Node

var spawnRateList: Array[SpawnRate]
var spawnRateSum: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func get_ball_spawn_type() -> PackedScene:
	var randInt = randi_range(1, spawnRateSum)
	var runningProbabilitySum = 0
	for spawnRate in spawnRateList:
		runningProbabilitySum+=spawnRate.spawnProbability
		if randInt <= runningProbabilitySum:
			return Constants.BALL_TYPES[spawnRate.spawnType]
	return null
	
func set_spawn_rate_list(spawnRateList: Array[SpawnRate]) -> void:
	self.spawnRateList = spawnRateList
	self.spawnRateSum=0
	for spawnRate in spawnRateList:
		spawnRateSum+=spawnRate.spawnProbability
