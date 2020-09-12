extends RigidBody2D
class_name Entity


signal initiated


onready var entities = $"/root/Game/WorldHolder/World/Entities"

var entity_type
var options

var correct = {
	"position": Vector2.ZERO,
	"rotation": 0,
	"linear_velocity": Vector2.ZERO,
	"angular_velocity": 0,
	"reset": false,
}


func init(entity_type, options):
	self.entity_type = entity_type
	self.options = options
	emit_signal("initiated")


puppet func correct(data):
	correct = data


func _integrate_forces(state):
	if correct:
		position = correct.position
		rotation = correct.rotation
		linear_velocity = correct.linear_velocity
		angular_velocity = correct.angular_velocity
		correct = null
