extends Node2D

@onready var arrowSprite: Node2D = $ArrowSprite
var arrowDir

var owningPlayer
var tile

var MAX_HEALTH=30
var health = MAX_HEALTH


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalBus.connect("_rotate_all_arrows", rotateArrow) 
	tile = get_parent()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	arrowDir=(arrowDir+Global.globalArrowRotate) % 360
	arrowSprite.rotation_degrees=arrowDir
	arrowSprite.modulate.a=(float(self.health)/self.MAX_HEALTH)
	pass
	
func setArrow(arrowDir_param, owningPlayer_param):
	arrowDir=arrowDir_param
	owningPlayer=owningPlayer_param
	arrowSprite.rotation_degrees=arrowDir
	arrowSprite.material.set_shader_parameter("rgb", owningPlayer.color)
	
func rotateArrow(degrees):
	self.arrowDir = (self.arrowDir+degrees) % 360
	arrowSprite.rotation_degrees=self.arrowDir


func lose_health(damage: int):
	self.health -= damage
	if self.health <= 0:
		self.destroy_arrow()
	
func _on_timer_timeout() -> void:
	self.destroy_arrow()
	pass # Replace with function body.
	
func destroy_arrow() -> void:
	var playerTileIndex= owningPlayer.controlledTiles.find(tile)
	owningPlayer.controlledTiles.remove_at(playerTileIndex)
	tile.owningPlayer=null
	tile.arrowInstance=null
	self.queue_free()
	
