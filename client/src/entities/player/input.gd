extends Node


export(Array, String) var allowed_inputs


func _input(event):
	if owner.name != str(get_tree().get_network_unique_id()):
		return
	
	for input in allowed_inputs: # rename input to action
		if event.is_action(input):
			var data = {}
			if event.is_pressed():
				match input:
					"primary_fire":
						data["mouse"] = owner.get_global_mouse_position()
						
			rpc_id(1, "input", input, event.is_pressed(), data)
