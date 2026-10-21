extends Node

var score = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var text
	if score > 0:
		text="+"+str(score)
	else:
		text=str(score)
	$Label.text = text
	
	pass # Replace with function body.

func play_animation(global_position_param, color):
	
	self.global_position = global_position_param
	var offset=15
	if self.global_position.y>90:
		offset = offset*-1
	var tween = get_tree().create_tween()
	tween.tween_property(self, "global_position", Vector2(self.global_position.x, self.global_position.y+offset), .5)
	tween.tween_callback(self.destroy)
	
	#var animation = $AnimationPlayer.get_animation("show_score_effect")
	#for idx in animation.get_track_count():
		#var path = animation.track_get_path(idx)
		#if(path.get_concatenated_names().contains("Label")):
			#var dir = self.global_position.y<90
			#if dir==false:
				#dir = -1
			#animation.track_set_key_value(idx, 1, Vector2(0, 10*int(dir)))
	
	$Label.material.set_shader_parameter("rgb", color)
	#$AnimationPlayer.play_backwards("show_score_effect")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func destroy() -> void:
	self.queue_free()
