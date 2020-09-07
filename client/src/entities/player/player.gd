extends Entity
class_name Player


onready var camera = $Camera


func _ready():
	if int(name) == get_tree().get_network_unique_id():
		camera.current = true
		# replace all .get_root with "/root/"
