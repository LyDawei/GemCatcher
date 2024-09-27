extends Area2D
@onready var score: AudioStreamPlayer2D = $"../AudioStreamPlayer2D"
@onready var game: Node2D = $".."
@export var speed = 500
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func handle_input(delta) -> void:
	if Input.is_action_pressed('left'):
		position.x -= speed * delta
	if Input.is_action_pressed('right'):
		position.x += speed * delta


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	handle_input(delta)
	pass


func _on_gem_area_entered(area: Area2D) -> void:
	if	area is Gem and area.position.y < position.y:
		score.play()
		game.addPoint(10)
		area.queue_free()
	pass # Replace with function body.
