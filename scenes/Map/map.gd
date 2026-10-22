extends Node2D
class_name PlayMap

@onready var tileMapLayer: TileMapLayer = $Tiles

var playerCount: int = 0
var baseSpawnRate: int
var mapName: String =""

var map_dimensions: Vector2i = Vector2.ZERO

var bases: Array[Base]
var spawners: Array[Spawner]

static func new_play_map(mapScene: PackedScene, baseSpawnRate: int, playerCount: int, mapName: String) -> PlayMap:
	if mapScene == null:
		return
	var instantiatedMap = mapScene.instantiate()
	instantiatedMap.baseSpawnRate = baseSpawnRate
	instantiatedMap.playerCount=playerCount
	instantiatedMap.mapName=mapName
		
	return instantiatedMap
	
func _ready():
	SignalBus.connect("_randomize_player_positions", randomize_bases)

func map_preparation():
	self.global_position=Vector2(81,81)
	self.map_dimensions = tileMapLayer.get_used_rect().size
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
		for base in baseGroup:
			base.set_player(players[i].playerNum)
		i+=1
		
func set_spawn_rates():
	for spawner in spawners:
		spawner.spawnChance = self.baseSpawnRate
