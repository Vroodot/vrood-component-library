extends Node
## Types.gd
## Global Autoload to hold reference to different "Types" i.e elements


@export_group("Colors", "color")
# Customize these in the inspector
@export var color_fire := Color.RED
@export var color_ice := Color.AQUAMARINE
@export var color_electric := Color.YELLOW
@export var color_poison := Color.WEB_PURPLE
@export var color_basic := Color.WHITE

@export var color_enemy := Color.RED
@export var color_allies := Color.BLUE
@export var color_neutral := Color.YELLOW


enum Element {
	FIRE,
	ICE,
	ELECTRIC,
	POISON,
	NONE,
}

enum Faction {
	ENEMY,
	ALLY,
	NEUTRAL,
	PLAYER,
}


func get_color_from_faction(faction: Faction) -> Color:
	match faction:
		Faction.ENEMY:
			return color_enemy
		Faction.ALLY:
			return color_allies
		Faction.NEUTRAL:
			return color_neutral
		_:
			return color_basic


func get_color_from_element(element: Element) -> Color:
	match element:
		Element.FIRE:
			return color_fire
		Element.ICE:
			return color_ice
		Element.ELECTRIC:
			return color_electric
		Element.POISON:
			return color_poison
		_:
			return color_basic
