extends Node
class_name HealthComponent
## Health Component covers all HP logic for altering health/hp

signal hp_altered(origin: int, new: int)
signal max_hp_altered(origin: int, new: int)
signal damaged(origin: int, new: int)
signal healed(origin: int, new: int)
signal hp_depleted()

signal resistance_altered(origin, int, new: int, element: Types.Element)

@export var hp_max: int = 100:
	set(v):
		if hp_max != v:
			hp_max = v
			
@export var hp_current: int:
	set(v):
		if hp_current != v:
			var original: int = hp_current
			hp_current = v
			hp_current = clampi(hp_current, 0, hp_max)
			if hp_current <= 0:
				hp_depleted.emit()
			else:
				hp_altered.emit(original, hp_current)


@export_group("Extras")
@export_subgroup("Damage Resistance")
@export var resist_generic: int:
	set(v):
		if resist_generic != v:
			var origin := resist_generic
			resist_generic = v
			resistance_altered.emit(origin, resist_generic)
@export var resist_magic: int:
	set(v):
		if resist_magic != v:
			var origin := resist_magic
			resist_magic = v
			resistance_altered.emit(origin, resist_magic)
@export var resist_physical: int:
	set(v):
		if resist_physical != v:
			var origin := resist_physical
			resist_physical = v
			resistance_altered.emit(origin, resist_physical)
@export var resist_fire: int:
	set(v):
		if resist_fire != v:
			var origin := resist_fire
			resist_fire = v
			resistance_altered.emit(origin, resist_fire, Types.Elements.FIRE)
@export var resist_ice: int:
	set(v):
		if resist_ice != v:
			var origin := resist_ice
			resist_ice = v
			resistance_altered.emit(origin, resist_ice, Types.Element.ICE)
@export var resist_electric: int:
	set(v):
		if resist_electric != v:
			var origin := resist_electric
			resist_electric = v
			resistance_altered.emit(origin, resist_electric, Types.Element.ELECTRIC)




func _ready() -> void:
	if hp_current == null:
		hp_current = hp_max


func take_damage(amount: int, is_magical: bool = false, element: Types.Element = Types.Element.NONE, allow_overflow_heal: bool = true) -> void:
	var damage := calculate_damage(amount, is_magical, element)
	if damage == 0: return

	var origin := hp_current
	if damage > 0:
		hp_current -= damage
		damaged.emit(origin, hp_current)
	elif damage < 0 and allow_overflow_heal:
		# subtract negative damage is healing
		hp_current -= damage
		healed.emit(origin, hp_current)


func calculate_damage(amount: int, is_magical: bool = false, element: Types.Element = Types.Element.NONE) -> int:
	## Damage = Amount - (GenericResist + [MagicResist or PhysicalResist] + ElementalResist)
	var reduction: int = resist_generic
	if is_magical:
		reduction += resist_magic
	else:
		reduction += resist_physical
	match  element:
		Types.Element.FIRE:
			reduction += resist_fire
		Types.Element.ICE:
			reduction += resist_ice
		Types.Element.ELECTRIC:
			reduction += resist_electric
		_:
			pass
	return amount - reduction
