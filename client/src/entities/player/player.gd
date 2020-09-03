extends Entity
class_name Player

# move shit here
func _ready():
	if int(name) == get_tree().get_network_unique_id():
		get_parent().get_node("Camera").follow(entity)
		# replace .get_root with "/root/"
