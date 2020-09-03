extends Entity
class_name Player


func _ready():
	if int(name) == get_tree().get_network_unique_id():
		$Camera.current = true
		# replace all .get_root with "/root/"
