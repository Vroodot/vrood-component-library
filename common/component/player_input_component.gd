extends Node
class_name PlayerInputComponent
## Component for handling Single Player Input
@export var up: String = "up"
@export var down: String = "down"
@export var left: String = "left"
@export var right: String = "right"


## TODO finish input handling
func get_input_vector() -> Vector2:
	return Input.get_vector(left, right, up, down)
