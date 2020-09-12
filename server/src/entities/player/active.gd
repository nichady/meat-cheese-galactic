extends State


onready var left_eye = owner.get_node("LeftEye")
onready var right_eye = owner.get_node("RightEye")

var mouse = Vector2.ZERO


func _enter(data = {}):
	mouse = data.mouse
	left_eye.show()
	right_eye.show()
	$FireTimer.start()


func _exit():
	left_eye.hide()
	right_eye.hide()
	$FireTimer.stop()


remote func mouse(pos):
	if owner.name == str(get_tree().get_rpc_sender_id()):
		mouse = pos


func _on_FireTimer_timeout():
	var direction = owner.position.direction_to(mouse)
	owner.entities.spawn("projectile.bolt", left_eye.global_position, {
		"source": owner.name,
		"team": owner.options.team,
		"direction": direction,
	})
	owner.entities.spawn("projectile.bolt", right_eye.global_position, {
		"source": owner.name,
		"team": owner.options.team,
		"direction": direction,
	})
