extends Node
# StatData.gd
# Global Autoload

var player: PlayerStats = PlayerStats.new()
var default: DefaultStats = DefaultStats.new()
var human_npc: HumanNPCStats = HumanNPCStats.new()

## Our baby
class PlayerStats:
	var max_hp: int = 25
	var speed_base: float = 350.0
	var speed_sprint: float = 700.0
	var speed_slow: float = 100.0
	
	var resist_fire: int = 1
	var resist_ice: int = 1
	var resist_electric: int = 1
	var resist_poison: int = 1
	var resist_magic: int = 1
	var resist_physical: int = 1
	var resist_generic: int = 1


## A dud Entity, give it some basic stats just in case
class DefaultStats:
	var max_hp: int = 1
	var speed_base: float = 0.0
	var speed_sprint: float = 0.0
	var speed_slow: float = 0.0

	var resist_fire: int = 1
	var resist_ice: int = 1
	var resist_electric: int = 1
	var resist_poison: int = 1
	var resist_magic: int = 1
	var resist_physical: int = 1
	var resist_generic: int = 1

# Random Example
class HumanNPCStats:
	var max_hp: int = 25
	var speed_base: float = 150.0
	var speed_sprint: float = 400.0
	var speed_slow: float = 200.0

	var resist_fire: int = 1
	var resist_ice: int = 1
	var resist_electric: int = 1
	var resist_poison: int = 1
	var resist_magic: int = 1
	var resist_physical: int = 1
	var resist_generic: int = 1
