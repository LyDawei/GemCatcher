extends Node2D

@export var gem: PackedScene
@onready var label: Label = $Label
@onready var timer: Timer = $Timer
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

var points = 0
var lives = 1

const EXPLODE = preload("res://assets/explode.wav")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func addPoint(value):
	points += value
	label.text = '%s' % points

func spawn_gem() -> void:
	var newGem: Gem = gem.instantiate()
	var randomNumber = randf_range(0, get_viewport_rect().size.x)
	newGem.onGemOffScreen.connect(gameover)
	newGem.position.x = randomNumber
	add_child(newGem)

func stop_all() -> void:
	timer.stop()
	for child in get_children():
		child.set_process(false)

func play_dead():
	audio_stream_player_2d.stop()
	audio_stream_player_2d.stream = EXPLODE
	audio_stream_player_2d.play()

func gameover(obj:Gem) -> void:
	lives -= 1
	if lives <= 0:
		stop_all()
		play_dead()
		print('gameover')

func _on_timer_timeout() -> void:
	spawn_gem()
	pass # Replace with function body.
