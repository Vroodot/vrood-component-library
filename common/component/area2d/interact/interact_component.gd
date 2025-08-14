extends Area2D
class_name InteractComponent

@export var can_interact: bool = true # disable interact component when needed

var interactables_in_range: Array[InteractableComponent] = []
var current_interact_target: InteractableComponent


func _ready() -> void:
	set_collision_layer_value(1,false)
	set_collision_mask_value(1, false)
	set_collision_mask_value(CollisionLayerLib.INTERACT, true)
	area_entered.connect(_on_enter)
	area_exited.connect(_on_exit)


func _process(_delta: float) -> void:
	if interactables_in_range and can_interact:
		interactables_in_range.sort_custom(_sort_interactables_by_nearest)
		if interactables_in_range[0].is_interactable:
			if interactables_in_range[0] != current_interact_target:
				# If our current target isn't the same as our closest target, do some cleanup
				# Toggling is_interact_target here emits signals from the interactables, which are picked up by UI
				current_interact_target.is_interact_target = false
				current_interact_target = interactables_in_range[0]
				current_interact_target.is_interact_target = true
	elif current_interact_target:
		# If we have no possible targets, wipe our interact pointer
		current_interact_target.is_interact_target = false
		current_interact_target = null

func _sort_interactables_by_nearest(a: Area2D, b: Area2D):
	var a_distance = global_position.distance_to(a.global_position)
	var b_distance = global_position.distance_to(b.global_position)
	return a_distance < b_distance

func interact() -> void:
	if can_interact and current_interact_target:
		# Causes the interact object to emit its signal to its parent
		current_interact_target.interact_with()



func _on_enter(interactable: InteractableComponent) -> void:
	interactables_in_range.push_back(interactable)

func _on_exit(interactable: InteractableComponent) -> void:
	interactables_in_range.erase(interactable)
