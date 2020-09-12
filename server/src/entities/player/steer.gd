extends StateMachine


onready var inputs = $"../Input".inputs


func _on_Input_input(event, pressed, data):
	transition_to(
		"Still" if inputs.turn_left == inputs.turn_right else
		"Left" if inputs.turn_left else
		"Right"
	)
