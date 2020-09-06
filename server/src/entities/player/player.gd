extends Entity
class_name Player


onready var inputs = $Input.inputs


# TODO replace all $ with onready at top
func _on_initiated(): # replace for all! # use method instead of signal
	name = options.user_id
	if options.team == 0:
		pass
	elif options.team == 1:
		pass


func _physics_process(delta):
	if inputs.turn_left != inputs.turn_right:
		if inputs.turn_left:
			if angular_velocity > -1.5:
				angular_velocity -= 1.5
		else:
			if angular_velocity < 1.5:
				angular_velocity += 1.5
