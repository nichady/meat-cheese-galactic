extends Entity
class_name Player


onready var inputs = $Input.inputs
onready var sprite = $Sprite
onready var movement = $Movement
onready var steer = $Steer


# TODO replace all $ with onready at top
func _on_initiated(): # replace for all! # use method instead of signal
	name = options.user_id


func _ready(): # decide ready or on_initiated for other classes aswell
	if options.team == 0:
		sprite.material.set_shader_param("outline_color", Color.blue)
	elif options.team == 1:
		rotation = PI
		sprite.material.set_shader_param("outline_color", Color.red)


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
