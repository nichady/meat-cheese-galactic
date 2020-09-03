extends Node


signal input(event, pressed)


export(Dictionary) var inputs


remote func input(event, pressed):
	if not (event is String and pressed is bool):
		return
	if not inputs.has(event):
		return
	
	inputs.event = pressed
	emit_signal("input", event, pressed)
	rpc("input", event, pressed)
