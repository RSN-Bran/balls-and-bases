extends CanvasLayer

const MOVE_SELECTOR_TIMER_BASE_WAIT_TIME = .1

@onready var startEventTimer: Timer= $EventStartTimer
@onready var timerToMoveSelector: Timer= $NinePatchRect/MoveSelectorTimer
@onready var vboxContainer: VBoxContainer = $NinePatchRect/VBoxContainer

var totalSelectorCycles: int = 0
var currentSelectorCycle: int = 0
var slowDownThreshold: int = 0

var eventLabel: PackedScene = load("res://scenes/EventContainer/EventMenuLabel/EventMenuLabel.tscn")

var events = []
var eventLabelSceneList = []

var currentIndex = 0

var selectedEvent: Event


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalBus.connect("_end_event", end_event)
	init_event_list()
	self.hide()
	events.shuffle()
	var i = 0
	for event in events:
		var eventLabelScene = eventLabel.instantiate()
		eventLabelSceneList.append(eventLabelScene)
		vboxContainer.add_child(eventLabelScene)
		eventLabelScene.set_text(event.eventName)
		eventLabelScene.owner=self
		eventLabelScene.index = i
		i+=1
	pass # Replace with function body.

func init_event_list():
	for key in Constants.EVENT_TYPES.keys():
		var event = Event.new_event(Constants.EVENT_TYPES[key])
		events.append(event)
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if owner.timer.time_left < 10:
		stop_event_timer()
	pass


func _on_timer_timeout() -> void:
	self.show()
	
	totalSelectorCycles = randi_range(10, 15)
	slowDownThreshold = randi_range(3, 6)
	currentSelectorCycle = 0
	
	owner.freeze_unfreeze([
		Constants.MATCH_COMPONENT_BALLS,
		Constants.MATCH_COMPONENT_MAP,
		Constants.MATCH_COMPONENT_TIMER
	], true)
	timerToMoveSelector.wait_time = MOVE_SELECTOR_TIMER_BASE_WAIT_TIME
	timerToMoveSelector.start()
	
	
	pass # Replace with function body.
	
func start_event() -> void:
	var eventIndex = currentSelectorCycle % events.size()
	selectedEvent = events[eventIndex]
	add_child(selectedEvent)
	selectedEvent.owner=self
	
	self.hide()
	owner.freeze_unfreeze([
		Constants.MATCH_COMPONENT_BALLS,
		Constants.MATCH_COMPONENT_MAP,
		Constants.MATCH_COMPONENT_TIMER
	], false)
	
	selectedEvent.start_event()
	
func end_event():
	start_event_timer()
	remove_child(selectedEvent)
	pass
	


func _on_timer_2_timeout() -> void:
	AudioManager.play_sound(AudioManager.SOUND_EFFECT_TYPE.MENU_CLICK, 1.0)
	currentSelectorCycle+=1	
	currentIndex = currentSelectorCycle % eventLabelSceneList.size()
			
	if currentSelectorCycle+slowDownThreshold == totalSelectorCycles:
		timerToMoveSelector.wait_time+=.2
	if currentSelectorCycle >= totalSelectorCycles:
		timerToMoveSelector.stop()
		$AnimationPlayer.play("start_event_wait")
		
	pass # Replace with function body.
	
func start_event_timer():
	var time_until_event = randi_range(5, 30)
	startEventTimer.wait_time = time_until_event
	startEventTimer.start()
	
func stop_event_timer():
	startEventTimer.stop()
	
