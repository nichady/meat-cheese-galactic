extends State


func _state_process(delta):
	if owner.angular_velocity > -2.25:
		var sum = owner.angular_velocity - 1.5
		if sum > -2.25:
			owner.angular_velocity = sum
		else:
			owner.angular_velocity = -2.25
