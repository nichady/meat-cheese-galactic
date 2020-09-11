extends RigidBody2D
class_name Entity


signal initiated


var entity_type
var options


func init(entity_type, options):
	self.entity_type = entity_type
	self.options = options
	emit_signal("initiated")


puppet func correct(data):
	self.position = data.position
	self.rotation = data.rotation
	self.linear_velocity = data.linear_velocity
	self.angular_velocity = data.angular_velocity
