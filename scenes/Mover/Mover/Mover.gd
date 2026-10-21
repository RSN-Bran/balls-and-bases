extends RigidBody2D
class_name Mover

@onready var animationPlayer: AnimationPlayer = $AnimationPlayer

static func new_mover(moverScene: PackedScene, initial_direction: Vector2, initial_position: Vector2, speedModifier: float) -> Mover:
	if moverScene == null:
		return
	var instantiatedScene = moverScene.instantiate()
		
	instantiatedScene.speedModifier=speedModifier
	instantiatedScene.direction=initial_direction
	instantiatedScene.initial_position=initial_position
	return instantiatedScene


@export var worth: int = 1
@export var speed: int = 100
@export var damage: int = 0

var direction: Vector2
var initial_position: Vector2
var speedModifier: float = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.global_position=self.initial_position
	SignalBus.connect("_set_mover_speed_modifier", set_speed_modifier) 
	calculate_velocity()
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func changeDirection(dir_param: Vector2) -> void:
	self.direction = dir_param
	calculate_velocity()
	
func set_speed_modifier(speedModifier: float) -> void:
	self.speedModifier=speedModifier
	calculate_velocity()
	
func calculate_velocity() -> void:
	self.linear_velocity = self.direction*self.speed*self.speedModifier
	
func get_worth(player) -> int:
	return self.worth
	
func fall_in_pit() -> void:
	self.animationPlayer.play("fall_in_pit")
	pass
	
func destroy():
	self.queue_free()
