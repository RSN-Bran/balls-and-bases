extends Node2D
class_name PlayMap

@export var playerCount: int = 0
@export var mapDimensions: Vector2

func _ready():
	SignalBus.connect("_randomize_player_positions", randomize_bases)
	
func randomize_bases():
	randomize()
	var bases = []
	for tile in self.get_node("Tiles").get_children():
		if tile is Base:
			bases.append(tile)
	var players = Global.get_players()
	players.shuffle()
	var i = 0
	
	while i < playerCount:
		var baseGroup = bases.filter(func(element): return element.groupNum==(i+1))
		for base in baseGroup:
			base.set_player(players[i].playerNum)
		i+=1
