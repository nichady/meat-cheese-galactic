extends Entity


func _on_initiated():
	if options.team == "blue":
		set_collision_layer_bit(1, true)
		modulate = Color.blue
	elif options.team == "red":
		set_collision_layer_bit(2, true)
		modulate = Color.red
		rotation_degrees = 180
