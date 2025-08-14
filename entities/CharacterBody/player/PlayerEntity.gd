extends GameEntityCharacterBody2D
class_name PlayerEntity

@export var player_input: PlayerInputComponent


func _ready() -> void:
	init_components()
	add_to_groups()


func _physics_process(delta: float) -> void:
	move.move_simple(player_input.get_input_vector(), delta)
	move_and_slide()


func add_to_groups() -> void:
	self.add_to_group("player")


func init_components() -> void:
	if health:
		health.hp_altered.connect(_on_hp_change)
		health.hp_max = StatData.player.max_hp
		health.hp_current = health.hp_max #TODO replace with serialization

	if hurtbox:
		if hurtbox.health == null:
			hurtbox.health = health

	if move:
		move.speed_base = StatData.player.speed_base
		move.speed_sprint = StatData.player.speed_sprint
		move.speed_slow = StatData.player.speed_slow


func _on_hp_change(origin: int, new: int) -> void:
	Events.player.health_altered.emit(origin, new)
