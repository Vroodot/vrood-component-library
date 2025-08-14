extends RigidBody2D
class_name GameEntityRigidBody2D

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


func init_components() -> void:
	if health:
		health.hp_max = StatData.default.max_hp
		health.resist_fire = StatData.default.resist_fire
		health.resist_ice = StatData.default.resist_ice
		health.resist_electric = StatData.default.resist_electric
		health.resist_poison = StatData.default.resist_poison
		health.resist_magic = StatData.default.resist_magic
		health.resist_physical = StatData.default.resist_physical
		health.resist_generic = StatData.default.resist_generic
	if hurtbox:
		if hurtbox.health == null:
			hurtbox.health = health
	if move:
		move.speed_base = StatData.default.speed_base
		move.speed_sprint = StatData.default.speed_sprint
		move.speed_slow = StatData.default.speed_slow
