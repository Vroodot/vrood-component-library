extends Node
## Events.gd
## Global Event bus

@warning_ignore_start("unused_signal") ## Since the signals aren't being emitted here, we're always throwing errors
var player: PlayerEvents = PlayerEvents.new()
var data: DataEvents = DataEvents.new()


class PlayerEvents:
	signal health_altered(origin: int, updated: int, emitter: Object)


class DataEvents:
	signal save_requested(requester: Object)
	signal load_requested(requester: Object)
	
	signal game_saved(emitter: Object)
	signal game_loaded(emitter: Object)
	
	signal entity_saved(entity: Node)
	signal entity_loaded(entity: Node)


@warning_ignore_restore("unused_signal")
