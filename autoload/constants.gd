extends Node

const PIXEL_DIMENSIONS = Vector2(320, 180)

const POSSIBLE_DIRECTIONS = {
	"UP": Vector2i(0,-1),
	"LEFT": Vector2i(-1,0),
	"DOWN": Vector2i(0,1),
	"RIGHT": Vector2i(1,0)
}

const MATCH_COMPONENT_BALLS=1
const MATCH_COMPONENT_MAP=2
const MATCH_COMPONENT_TIMER=3

const GAME_STATE_MAIN_MENU = 1
const GAME_STATE_IN_GAME=2

const MATCH_STATE_PLAYING = 1
const MATCH_STATE_BETWEEN_GAMES = 2
const MATCH_STATE_GAME_END = 3

enum MENU_TYPE {
	PREVIOUS,
	NONE,
	MAIN_MENU,
	GAME_SETTINGS,
	MATCH_SETTINGS,
	PAUSE_MENU,
	BETWEEN_ROUNDS,
	MAP_SELECT
}

enum BALL_TYPE {
	STANDARD_BALL,
	SPIKE_BALL,
	GOLD_BALL,
	ITEM_BALL
}

enum EVENT_TYPE {
	NONE,
	COMMUNISM,
	FREEZE,
	MORE_BALLS,
	RANDOMIZE_POSITIONS,
	SPEED_DOWN,
	SPEED_UP,
	SPINNING_ARROWS
}

var MENU_TYPES: Dictionary = {}
var BALL_TYPES: Dictionary = {}
var EVENT_TYPES: Dictionary = {}

var maps: Array[PlayMap] = []

func _ready() -> void:
	BALL_TYPES[BALL_TYPE.STANDARD_BALL]= load("res://scenes/Mover/Ball/Ball.tscn")
	BALL_TYPES[BALL_TYPE.SPIKE_BALL]= load("res://scenes/Mover/Spike Ball/spike_ball.tscn")
	BALL_TYPES[BALL_TYPE.GOLD_BALL]= load("res://scenes/Mover/Gold Ball/gold_ball.tscn")
	BALL_TYPES[BALL_TYPE.ITEM_BALL]= load("res://scenes/Mover/Item Ball/item_ball.tscn")
	
	MENU_TYPES[MENU_TYPE.MAIN_MENU] = load("res://scenes/Menus/MainMenu/MainMenu.tscn")
	MENU_TYPES[MENU_TYPE.GAME_SETTINGS] = load("res://scenes/Menus/GameSettingsMenu/GameSettingsMenu.tscn")
	MENU_TYPES[MENU_TYPE.MATCH_SETTINGS] = load("res://scenes/Menus/MatchSettingsMenu/MatchSettingsMenu.tscn")
	MENU_TYPES[MENU_TYPE.PAUSE_MENU] = load("res://scenes/Menus/PauseMenu/PauseMenu.tscn")
	MENU_TYPES[MENU_TYPE.BETWEEN_ROUNDS] = load("res://scenes/BetweenGamesHUD/BetweenGamesHUD.tscn")
	MENU_TYPES[MENU_TYPE.MAP_SELECT] = load("res://scenes/Menus/MapSelectMenu/MapSelectMenu.tscn")
	
	EVENT_TYPES[EVENT_TYPE.COMMUNISM] = load("res://scenes/Events/NeutralEvents/Communism/CommunismEvent.tscn")
	EVENT_TYPES[EVENT_TYPE.FREEZE]=load("res://scenes/Events/NeutralEvents/Freeze/FreezeEvent.tscn" )
	EVENT_TYPES[EVENT_TYPE.MORE_BALLS]=load("res://scenes/Events/NeutralEvents/MoreBalls/MoreBallsEvent.tscn" )
	EVENT_TYPES[EVENT_TYPE.RANDOMIZE_POSITIONS] = load("res://scenes/Events/NeutralEvents/RandomizePlayerPositions/RandomizePositionsEvent.tscn" )
	EVENT_TYPES[EVENT_TYPE.SPEED_DOWN] = load("res://scenes/Events/NeutralEvents/SpeedDown/SpeedDownEvent.tscn")
	EVENT_TYPES[EVENT_TYPE.SPEED_UP]=load("res://scenes/Events/NeutralEvents/SpeedUp/SpeedUpEvent.tscn")
	EVENT_TYPES[EVENT_TYPE.SPINNING_ARROWS] = load("res://scenes/Events/NeutralEvents/SpinningArrows/SpinningArrows.tscn")
	
	maps = [
		PlayMap.new_play_map(load("res://scenes/Map/Maps/Map1.tscn"), 50, 4, "Map 1"),
		PlayMap.new_play_map(load("res://scenes/Map/Maps/Map2.tscn"), 20, 4, "Map 2"),
		PlayMap.new_play_map(load("res://scenes/Map/Maps/Map3.tscn"), 60, 4, "Map 3")
	]
