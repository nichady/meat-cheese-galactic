extends Entity
class_name Player


func _on_initiated(): # replace for all!
	name = options.user_id
	if options.team == 0:
		pass
	elif options.team == 1:
		pass
