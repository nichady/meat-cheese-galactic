extends Entity
class_name Player


onready var inputs = $Input.inputs


func _ready():
	if int(name) == get_tree().get_network_unique_id():
		$Camera.current = true
		# replace all .get_root with "/root/"


func _physics_process(delta):
	if inputs.turn_left != inputs.turn_right:
		if inputs.turn_left:
			if angular_velocity > -1.5:
				angular_velocity -= 1.5
		else:
			if angular_velocity < 1.5:
				angular_velocity += 1.5
