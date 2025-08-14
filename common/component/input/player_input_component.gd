extends Node
class_name PlayerInputComponent
## Component for handling Single Player Input
@export_group("Move Inputs", "move")
@export var move_up: StringName = &"up"
@export var move_down: StringName = &"down"
@export var move_left: StringName = &"left"
@export var move_right: StringName = &"right"


@export var interact: StringName = &"interact"

## TODO finish input handling
func get_input_vector() -> Vector2:
	return Input.get_vector(move_left, move_right, move_up, move_down)

func get_input_vect_normalized() -> Vector2:
	return get_input_vector().normalized()

func wants_interact() -> bool:
	return Input.is_action_just_pressed(interact)
