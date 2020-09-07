extends State


func _state_process(delta):
	owner.linear_velocity += -100 * owner.transform.y
