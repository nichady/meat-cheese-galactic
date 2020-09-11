extends RigidBody2D
class_name Entity


signal initiated


export(String) var entity_type
export(Dictionary) var options


func init(entity_type, options):
	self.entity_type = entity_type
	self.options = options
	emit_signal("initiated")


func correct(id = null):
	var data = {
		"position": position,
		"rotation": rotation,
		"linear_velocity": linear_velocity,
		"angular_velocity": angular_velocity,
	}
	rpc_id(int(id), "correct", data) if id else rpc("correct", data) # use ternaries more, even on non-assignments
