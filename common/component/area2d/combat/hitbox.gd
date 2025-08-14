extends Area2D
class_name Hitbox
## Box that hits
## Actual logic is handled by hurtbox.gd


@export var damage: int = 1
@export var element: Types.Element = Types.Element.NONE
@export var ignore_resistance: bool = false
@export var is_magic: bool = false


func _ready() -> void:
	monitoring = false
	# disable main layer
	set_collision_mask_value(1, false)
	set_collision_layer_value(1, false)
	
	set_collision_layer_value(CollisionLayerLib.HITBOXES, true)
	set_collision_mask_value(CollisionLayerLib.HITBOXES, true)
