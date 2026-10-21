extends PanelContainer

var styleBox = get_theme_stylebox("panel")
var index = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func set_text(text):
	$EventMenuLabel.text = text
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if owner == null:
		return
	if index == owner.currentIndex:
		styleBox.bg_color = Color(255, 255, 255)
		$EventMenuLabel.set("theme_override_colors/font_color", Color(0, 0, 0)) 
	else:
		styleBox.bg_color= Color(0, 0, 0)
		$EventMenuLabel.set("theme_override_colors/font_color", Color(255, 255, 255)) 
	pass
