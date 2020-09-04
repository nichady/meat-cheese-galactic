extends Node


signal input(event, pressed)


#export(Dictionary) var inputs
export(Array, String) var allowed_inputs
const inputs = { }


remote func input(event, pressed):
	if not (event is String and pressed is bool):
		return
	if not allowed_inputs.has(event):
		return
	if get_tree().get_rpc_sender_id() != int(get_parent().name):
		return
	
	inputs[event] = pressed
	emit_signal("input", event, pressed)
	rpc("input", event, pressed)
