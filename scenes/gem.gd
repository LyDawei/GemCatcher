extends Area2D
class_name Gem

signal onGemOffScreen
@export var speed = 100
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y += speed * delta
	rotate(0.025)
	
	if position.y >= get_viewport_rect().size.y:
		onGemOffScreen.emit(self)
		set_process(false)
		queue_free()
