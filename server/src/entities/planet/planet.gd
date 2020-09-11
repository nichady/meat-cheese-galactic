extends Entity


func _on_initiated():
	if options.team == "blue":
		modulate = Color.blue
	elif options.team == "red":
		modulate = Color.red
		rotation = PI
