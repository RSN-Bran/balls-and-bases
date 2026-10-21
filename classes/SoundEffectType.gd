extends Resource
class_name SoundEffectType

@export var playingLimit: int = 1
@export var soundFile: AudioStreamMP3
#@export var soundType: SOUND_EFFECT_TYPE
var nodeGroup: Node

static func NewSoundEffectType(playingLimit: int, soundFile: AudioStreamMP3, pitch: float) -> SoundEffectType:
	var newSoundEffectType = SoundEffectType.new()
	newSoundEffectType.playingLimit=playingLimit
	newSoundEffectType.soundFile=soundFile
	
	newSoundEffectType.nodeGroup = Node.new()
	return newSoundEffectType
	

func play_sound(pitchOverride):
	if self.nodeGroup.get_children().size() < self.playingLimit:
		var newStream = AudioStreamPlayer.new()
		self.nodeGroup.add_child(newStream)
		newStream.stream=self.soundFile
		if pitchOverride != null:
			newStream.pitch_scale = pitchOverride
		else:
			newStream.pitch_scale = self.pitch
		newStream.play()
		newStream.finished.connect(newStream.queue_free)
