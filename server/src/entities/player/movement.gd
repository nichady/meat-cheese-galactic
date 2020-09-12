extends StateMachine


onready var inputs = $"../Input".inputs


func _on_Input_input(event, pressed, data):
	transition_to(
		"Still" if inputs.move_forwards == inputs.move_backwards else
		"Forward" if inputs.move_forwards else
		"Reverse"
	)
	owner.correct()
