extends CharacterBody2D
class_name GameEntityCharacterBody2D

@export_group("States")
@export var is_on_fire: bool = false
@export var is_wet: bool = false
@export var is_electrified: bool = false
@export var is_poisoned: bool = false


@export_group("Components")
@export var health: HealthComponent
@export var move: MovementComponent
@export var hurtbox: Hurtbox


func _ready() -> void:
	init_components()


## When overwritting this function
## Simply replace `default` with the appropriate sub-class
func init_components() -> void:
	if health:
		health.hp_max = StatData.default.max_hp
		health.hp_current = health.hp_max
	if hurtbox:
		if hurtbox.health == null:
			hurtbox.health = health
	if move:
		move.speed_base = StatData.default.speed_base
		move.speed_sprint = StatData.default.speed_sprint
		move.speed_slow = StatData.default.speed_slow
