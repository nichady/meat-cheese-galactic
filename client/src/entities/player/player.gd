extends Entity
class_name Player


onready var sprite = $Sprite
onready var camera = $Camera


func _ready():
	if options.team == 0:
		sprite.material.set_shader_param("outline_color", Color.blue)
	elif options.team == 1:
		rotation = PI
		sprite.material.set_shader_param("outline_color", Color.red)
	
	if int(name) == get_tree().get_network_unique_id():
		camera.follow()
		# replace all .get_root with "/root/"
