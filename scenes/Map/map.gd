extends Node2D
class_name PlayMap

@onready var tileMapLayer: TileMapLayer = $Tiles

@export var playerCount: int = 0
@export var baseSpawnRate: int

var bases: Array[Base]
var spawners: Array[Spawner]

func _ready():
	SignalBus.connect("_randomize_player_positions", randomize_bases)
	print(tileMapLayer.get_children())

func map_preparation():
	for tile in tileMapLayer.get_children():
		if tile is Base:
			bases.append(tile)
		elif tile is Spawner:
			spawners.append(tile)
	randomize_bases()
	set_spawn_rates()
	
func randomize_bases():
	randomize()
	var players = Global.get_players()
	players.shuffle()
	var i = 0
	
	while i < playerCount:
		var baseGroup = bases.filter(func(element): return element.groupNum==(i+1))
		print(baseGroup)
		for base in baseGroup:
			base.set_player(players[i].playerNum)
		i+=1
		
func set_spawn_rates():
	for spawner in spawners:
		spawner.spawnChance = self.baseSpawnRate
