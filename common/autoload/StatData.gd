extends Node
# StatData.gd
# Global Autoload

var player: PlayerStats = PlayerStats.new()
var default: DefaultStats = DefaultStats.new()
var human_npc: HumanNPCStats = HumanNPCStats.new()

## Our baby
class PlayerStats:
	var max_hp: int = 25
	var speed_base: float = 150.0
	var speed_sprint: float = 400.0
	var speed_slow: float = 200.0

## A dud Entity, give it some basic stats just in case
class DefaultStats:
	var max_hp: int = 1
	var speed_base: float = 0.0
	var speed_sprint: float = 0.0
	var speed_slow: float = 0.0


class HumanNPCStats:
	var max_hp: int = 25
	var speed_base: float = 150.0
	var speed_sprint: float = 400.0
	var speed_slow: float = 200.0
