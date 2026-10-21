extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Tile._ready()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_area_entered(area: Area2D) -> void:
	var ball = area.get_parent()
	ball.fall_in_pit()
	pass # Replace with function body.
