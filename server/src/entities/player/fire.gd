extends StateMachine


func _on_Input_input(event, pressed, data):
	if event == "primary_fire":
		transition_to("Active" if pressed else "Inactive", data)
