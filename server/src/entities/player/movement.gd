extends StateMachine


onready var player = owner


func _on_input(event, pressed):
	if player.inputs.move_forwards == player.inputs.move_backwards:
		transition_to("Still")
	elif player.inputs.move_forwards:
		transition_to("Forward")
	else:
		transition_to("Reverse")
