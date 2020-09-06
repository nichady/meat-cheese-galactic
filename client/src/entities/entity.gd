extends RigidBody2D
class_name Entity


signal initiated


var entity_type
var options


func init(entity_type, options):
	self.entity_type = entity_type
	self.options = options
	emit_signal("initiated")


puppet func correct(position, rotation, linear_velocity, angular_velocity):
	self.position = position
	self.rotation = rotation
	self.linear_velocity = linear_velocity
	self.angular_velocity = angular_velocity
