extends Entity
class_name Player


onready var sprite = $Sprite
onready var camera = $Camera
onready var left_eye_sprite = $LeftEye/Sprite
onready var right_eye_sprite = $RightEye/Sprite


func _ready():
	if options.team == 0:
		sprite.material.set_shader_param("outline_color", Color.blue)
	elif options.team == 1:
		rotation = PI
		sprite.material.set_shader_param("outline_color", Color.red)
		left_eye_sprite.texture = Globals.eyeglow_red
		right_eye_sprite.texture = Globals.eyeglow_red
		
	
	if int(name) == get_tree().get_network_unique_id():
		camera.follow()
		# replace all .get_root with "/root/"
