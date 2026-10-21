extends Node2D

@onready var spawnHandler: Node = $SpawnHandler

@export var spawnChance: int = 10


var spawnRates: Array[SpawnRate] = []
var spawnChanceModifier: int =1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	SignalBus.connect("_set_spawner_modifier", set_spawn_chance_modifier)
	SignalBus.connect("_set_spawner_rates", set_spawner_spawn_rates)	
	
	self.spawnRates = [
		SpawnRate.New(Constants.BALL_TYPE.STANDARD_BALL, 96),
		SpawnRate.New(Constants.BALL_TYPE.GOLD_BALL, 2),
		SpawnRate.New(Constants.BALL_TYPE.SPIKE_BALL, 2)
	]
	
	self.spawnHandler.set_spawn_rate_list(self.spawnRates)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var checkSpawn = randi_range(1,500)
	if checkSpawn <= spawnChance*spawnChanceModifier:
		spawn_ball()
	pass

func set_spawn_chance_modifier(modifier: float) -> void:
	self.spawnChanceModifier=modifier

func set_spawner_spawn_rates(spawnRateList: Array[SpawnRate]) -> void:
	self.spawnHandler.set_spawn_rate_list(spawnRateList)
	pass
	
func spawn_ball() -> void:
	var ballTypeRand = randi_range(1,100)
	var ballToSpawn = spawnHandler.get_ball_spawn_type()
	var mover = Mover.new_mover(
		ballToSpawn, 
		Constants.POSSIBLE_DIRECTIONS[randi_range(0, Constants.POSSIBLE_DIRECTIONS.size()-1)], 
		self.global_position, 
		Global.globalSpeedModifier
	)
	if mover != null:
		SignalBus.emit_signal("_spawn_mover", mover)
	pass
	
