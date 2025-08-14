extends Area2D
class_name InteractableComponent

## Set objects to be Interactables


signal interacted_with # emitted on interact, Parent connects to this signal

## To be used by parent's UI elements
signal is_targeted(interaction_name: String, icon: Texture2D)
signal is_un_targeted


@export var interact_name: String = ""
@export var interact_icon: Texture2D
@export var is_interactable: bool = true # sometimes we want to temporarily deactivate some interact objects



var is_interact_target: bool = false:
	set(v):
		if is_interact_target != v:
			is_interact_target = v
			if is_interact_target == true:
				if interact_icon:
					is_targeted.emit(interact_name, interact_icon)
				else:
					is_targeted.emit(interact_name)
			else:
				is_un_targeted.emit()


func _ready() -> void:
	self.add_to_group("interactable_area") # perhaps unneccessary, but easy to access how many interactable_area are in a scene this way
	set_collision_layer_value(1,false)
	set_collision_mask_value(1, false)
	# No need for a mask with this setup
	set_collision_layer_value(CollisionLayerLib.INTERACT, true)



func interact_with() -> void:
	interacted_with.emit()
