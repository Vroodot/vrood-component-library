extends Node
class_name MovementComponent


@export var parent_node: Node2D
@export var speed_default: float = 140.0
@export var speed_fast: float = 280.0
@export var speed_slow: float = 100.0

func _ready() -> void:
	if parent_node == null:
		parent_node = get_parent()


func move(direction: Vector2, speed: float, delta: float = 1.0) -> void:
	if parent_node is CharacterBody2D:
		parent_node.velocity = direction * speed * delta
	elif parent_node is RigidBody2D:
		parent_node.apply_central_impulse(direction * speed * delta)
	elif parent_node is Node2D:
		parent_node.global_position += direction * speed * delta
	else:
		push_warning(parent_node.name, " is invalid MoveComponent Target")
