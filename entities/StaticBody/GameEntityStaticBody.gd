extends StaticBody2D
class_name GameEntityStaticBody2D

@export_group("States")
@export var is_on_fire: bool = false
@export var is_wet: bool = false
@export var is_electrified: bool = false
@export var is_poisoned: bool = false


@export var health: HealthComponent
@export var hurtbox: Hurtbox

func _ready() -> void:
	init_components()



func init_components() -> void:
	if health:
		health.hp_max = StatData.default.max_hp
	if hurtbox:
		if hurtbox.health == null:
			hurtbox.health = health
