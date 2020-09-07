extends Entity
class_name Player


onready var inputs = $Input.inputs
onready var movement = $Movement
onready var steer = $Steer


# TODO replace all $ with onready at top
func _on_initiated(): # replace for all! # use method instead of signal
	name = options.user_id
	if options.team == 0:
		pass
	elif options.team == 1:
		pass


func _on_Input_input(event, pressed):
	movement.transition_to(
		"Still" if inputs.move_forwards == inputs.move_backwards else
		"Forward" if inputs.move_forwards else
		"Reverse"
	)
	
	steer.transition_to(
		"Still" if inputs.turn_left == inputs.turn_right else
		"Left" if inputs.turn_left else
		"Right"
	)
