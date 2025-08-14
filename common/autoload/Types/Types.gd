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

enum Element {
	FIRE,
	ICE,
	ELECTRIC,
	POISON,
	NONE,
}

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
