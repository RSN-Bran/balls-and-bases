extends Node

enum SOUND_EFFECT_TYPE {
	MENU_CLICK,
	GAIN_POINTS,
	LOSE_POINTS
}

@export var soundEffectList: Array [SoundEffectType]
var soundEffectDict: Dictionary = {}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	soundEffectDict[SOUND_EFFECT_TYPE.MENU_CLICK] = SoundEffectType.NewSoundEffectType(2, AudioStreamMP3.load_from_file("res://assets/sounds/menu_sound.mp3"), 1)
	soundEffectDict[SOUND_EFFECT_TYPE.GAIN_POINTS] = SoundEffectType.NewSoundEffectType(10, AudioStreamMP3.load_from_file("res://assets/sounds/blip.mp3"), 1 )
	soundEffectDict[SOUND_EFFECT_TYPE.LOSE_POINTS] = SoundEffectType.NewSoundEffectType(10, AudioStreamMP3.load_from_file("res://assets/sounds/hurt.mp3"), 1 )
	
	for soundEffectType in SOUND_EFFECT_TYPE:
		soundEffectDict[SOUND_EFFECT_TYPE[soundEffectType]].nodeGroup.name = soundEffectType
		add_child(soundEffectDict[SOUND_EFFECT_TYPE[soundEffectType]].nodeGroup)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func play_sound(soundEffectTypeId: SOUND_EFFECT_TYPE, pitchOverride: float) -> void:
	soundEffectDict[soundEffectTypeId].play_sound(pitchOverride)
	pass
