extends Node
class_name SpawnRate

var spawnType: int
var spawnProbability: int
var scene: PackedScene

static func New(spawnType: int, spawnProbability: int) -> SpawnRate:
	var newSpawnRate = SpawnRate.new()
	newSpawnRate.spawnType=spawnType
	newSpawnRate.spawnProbability=spawnProbability
	newSpawnRate.scene=Constants.BALL_TYPES[spawnType]
	return newSpawnRate
