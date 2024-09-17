extends Area2D

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
