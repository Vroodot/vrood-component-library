extends GameEntityCharacterBody2D
class_name PlayerEntity

@export var player_input: PlayerInputComponent
@export var interact_area: InteractComponent


func _ready() -> void:
	init_components()
	add_to_groups()


func _physics_process(delta: float) -> void:
	move.move_simple(player_input.get_input_vect_normalized())
	move_and_slide()

func _process(delta: float) -> void:
	if player_input.wants_interact():
		interact_area.interact()


func add_to_groups() -> void:
	faction = Types.Faction.PLAYER
	self.add_to_group("player")


func init_components() -> void:
	if health:
		# TODO: Serialize Player's StatData for SaveLoaders
		health.hp_altered.connect(_on_hp_change)
		health.hp_max = StatData.player.max_hp
		health.resist_fire = StatData.player.resist_fire
		health.resist_ice = StatData.player.resist_ice
		health.resist_electric = StatData.player.resist_electric
		health.resist_poison = StatData.player.resist_poison
		health.resist_magic = StatData.player.resist_magic
		health.resist_physical = StatData.player.resist_physical
		health.resist_generic = StatData.player.resist_generic
		health.hp_current = health.hp_max
	if hurtbox:
		if hurtbox.health == null:
			hurtbox.health = health

	if move:
		move.speed_base = StatData.player.speed_base
		move.speed_sprint = StatData.player.speed_sprint
		move.speed_slow = StatData.player.speed_slow


func _on_hp_change(origin: int, new: int) -> void:
	# Just an example, nothing currently uses this signal as of 8/14/25
	Events.player.health_altered.emit(origin, new)
