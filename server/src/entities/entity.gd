extends RigidBody2D
class_name Entity


signal initiated


export(String) var entity_type
export(Dictionary) var options



func init(entity_type, options):
	self.entity_type = entity_type
	self.options = options
	emit_signal("initiated")
