extends CharacterBody2D
class_name GameEntityCharacterBody2D

@export_group("Components")
@export var health_component: HealthComponent
@export var move_component: MovementComponent

func _ready() -> void:
	if health_component == null:
		health_component = HealthComponent.new()
		add_child(health_component)

	if move_component == null:
		move_component = MovementComponent.new()
		add_child(move_component)
	init_component_stats_from_database()


func init_component_stats_from_database() -> void:
	pass
