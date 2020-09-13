extends RigidBody2D
class_name Entity


signal initiated


onready var entities = $"/root/Game/WorldHolder/World/Entities"

var entity_type
var options

var correct = null


func init(entity_type, options):
	self.entity_type = entity_type
	self.options = options
	emit_signal("initiated")


puppet func correct(data):
	correct = data


func _integrate_forces(state):
	if correct:
		state.transform = Transform2D(correct.rotation, correct.position)
		state.linear_velocity = correct.linear_velocity
		state.angular_velocity = correct.angular_velocity
		correct = null
