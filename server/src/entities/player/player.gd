extends Entity
class_name Player


onready var sprite = $Sprite
onready var left_eye_sprite = $LeftEye/Sprite
onready var right_eye_sprite = $RightEye/Sprite


# TODO replace all $ with onready at top
func _on_initiated(): # replace for all! # use method instead of signal
	name = options.user_id


func _ready(): # decide ready or on_initiated for other classes aswell
	if options.team == 0:
		sprite.material.set_shader_param("outline_color", Color.blue)
	elif options.team == 1:
		rotation = PI
		sprite.material.set_shader_param("outline_color", Color.red)
		left_eye_sprite.texture = Globals.eyeglow_red
		right_eye_sprite.texture = Globals.eyeglow_red
