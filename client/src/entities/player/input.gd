extends Node


signal input(event, pressed)


const inputs = { }


puppet func input(event, pressed):
	inputs[event] = pressed
	emit_signal("input", event, pressed)


func _input(event):
	for action in InputMap.get_actions():
		if event.is_action(action):
			rpc_id(1, "input", action, event.is_pressed())
