extends Camera2D


func _ready():
	set_as_toplevel(true)


func _physics_process(delta):
	position = owner.position
	rotation = lerp_angle(rotation, owner.rotation, 3 * delta)


func follow():
	reset_smoothing()
	rotation = owner.rotation
	current = true
