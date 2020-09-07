extends Camera2D


func _ready():
	set_as_toplevel(true)


func _physics_process(delta):
	position = owner.position
	rotation = lerp_angle(rotation, owner.rotation, 3 * delta)
#	var noderot = get_parent().rotation_degrees if get_parent().rotation_degrees >= 0 else get_parent().rotation_degrees + 360
#	var thisrot = rotation_degrees % 360
#	if thisrot < 0: thisrot += 360
#	var difference = noderot - thisrot
#	if abs(difference) > 180: difference -= 360 * sign(difference)
#	if abs(difference) > 10: rotation_degrees = noderot - 10 * sign(difference)
