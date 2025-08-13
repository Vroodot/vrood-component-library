extends RigidBody2D
class_name GameEntityRigidBody2D

@export var health_component: HealthComponent

func _ready() -> void:
	if health_component == null:
		health_component = HealthComponent.new()
		add_child(health_component)
