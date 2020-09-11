extends State


func _state_process(delta):
	owner.linear_velocity += 30 * owner.transform.y
