extends Node


signal input(event, pressed, data)


export(Array, String) var allowed_inputs
const inputs = { }


func _ready():
	for input in allowed_inputs:
		inputs[input] = false


remote func input(event, pressed, data): # rename event to action # data param security.. client might be able to hack that
	if not (event is String and pressed is bool):
		return
	if not allowed_inputs.has(event):
		return
	if owner.name != str(get_tree().get_rpc_sender_id()):
		return
	
	inputs[event] = pressed
	emit_signal("input", event, pressed, data) # dont know if emitting parameters is needed
