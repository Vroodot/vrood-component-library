extends Area2D
class_name Healbox
## Box that heals
## Actual logic is handled by hurtbox.gd

@export var healing: int = 1


func _ready() -> void:
	monitoring = false
	# disable main layer
	set_collision_mask_value(1, false)
	set_collision_layer_value(1, false)
	
	set_collision_layer_value(CollisionLayerLib.HITBOXES, true)
	set_collision_mask_value(CollisionLayerLib.HITBOXES, true)
