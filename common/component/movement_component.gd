extends Node
class_name MovementComponent

@export var target: Node2D

@export var speed_base: float = 100.0
@export var speed_sprint: float = 200.0
@export var speed_slow: float = 75.0

func _ready() -> void:
	if target == null:
		target = get_parent()
		assert(target is Node2D)

#TODO Implement move complex 2D entity movment
func move_simple(direction: Vector2, delta: float = 1.0) -> void:
	var move: Vector2 = direction * speed_base * delta
	if target is CharacterBody2D:
		target.velocity = move
	elif target is RigidBody2D:
		target.linear_velocity = move
	elif target is Node2D:
		target.global_position += move
