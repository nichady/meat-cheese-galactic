extends Node


func _input(event):
	for action in InputMap.get_actions():
		if event.is_action(action):
			rpc_id(1, "input", action, event.is_pressed())
