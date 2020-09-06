extends Node


signal input(event, pressed)


export(Array, String) var allowed_inputs
const inputs = { }


func _ready():
	for input in allowed_inputs:
		inputs[input] = false


puppet func input(event, pressed):
	inputs[event] = pressed
	emit_signal("input", event, pressed)


func _input(event):
	for action in InputMap.get_actions():
		if event.is_action(action):
			rpc_id(1, "input", action, event.is_pressed())
