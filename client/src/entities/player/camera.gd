extends Camera2D


func _ready():
	set_as_toplevel(true)


func _physics_process(delta):
	position = get_parent().position
	
	var noderot = get_parent().rotation_degrees if get_parent().rotation_degrees >= 0 else get_parent().rotation_degrees + 360
	var thisrot = rotation_degrees
	while abs(thisrot) > 360: thisrot -= 360 * sign(thisrot)
	if thisrot < 0: thisrot += 360
	var difference = noderot - thisrot
	if abs(difference) > 180: difference -= 360 * sign(difference)
	if abs(difference) > 10: rotation_degrees = noderot - 10 * sign(difference)
