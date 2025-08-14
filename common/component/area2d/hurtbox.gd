extends Area2D
class_name Hurtbox
## Box that can be hurt/healed

@export var health: HealthComponent

func _ready() -> void:
	# disable main layer
	set_collision_mask_value(1, false)
	set_collision_layer_value(1, false)
	
	set_collision_layer_value(CollisionLayerLib.HITBOXES, true)
	set_collision_mask_value(CollisionLayerLib.HITBOXES, true)
	area_entered.connect(_on_hitbox_collision)


func _on_hitbox_collision(hitbox: Area2D) -> void:
	# should prevent hitting self, but worth retesting at scale
	if owner == hitbox.owner: return
	
	if hitbox is Hitbox:
		health.take_damage(hitbox.damage,
						hitbox.ignore_resistance,
						hitbox.is_magic,
						hitbox.element)
	elif hitbox is Healbox:
		health.heal(hitbox.healing)
