extends Entity
class_name Player


export(Dictionary) var inputs


func _on_initiated(): # replace for all!
	name = options.user_id
	if options.team == 0:
		pass
	elif options.team == 1:
		pass


remote func input(event, pressed):
	if not (event is String and pressed is bool):
		return
	
	if not inputs.has(event):
		return
	
	inputs.event = pressed
