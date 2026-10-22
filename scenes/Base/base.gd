extends Node2D
class_name Base

var ScoreEffectScene = load("res://scenes/ScoreEffect/ScoreEffect.tscn")


var playerNum = 0
@export var groupNum = 0

var player
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func set_player(playerNum):
	if playerNum == 0:
		return
	self.playerNum=playerNum
	self.player = Global.get_player(playerNum)
	var color = null
	if "color" in self.player:
		color = self.player.color
	else:
		Vector3(0,0,0)
	$Sprite.material.set_shader_parameter("rgb", color)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_area_entered(area: Area2D) -> void:
	
	var ball = area.get_parent()
	ball.queue_free()
	var scoreChange = ball.get_worth(player)
	if scoreChange > 0:
		AudioManager.play_sound(AudioManager.SOUND_EFFECT_TYPE.GAIN_POINTS, 1.0+player.soundEffectPitchOffset)
	elif scoreChange < 0:
		AudioManager.play_sound(AudioManager.SOUND_EFFECT_TYPE.LOSE_POINTS, 1.0+player.soundEffectPitchOffset)
	player.score += scoreChange
	var ScoreEffectInstance = ScoreEffectScene.instantiate()
	ScoreEffectInstance.score=scoreChange
	self.add_child(ScoreEffectInstance)
	ScoreEffectInstance.play_animation(self.global_position, player.color)
	$AnimationPlayer.play("get_point_animation")
	pass # Replace with function body.
