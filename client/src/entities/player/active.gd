extends State


onready var left_eye = owner.get_node("LeftEye")
onready var right_eye = owner.get_node("RightEye")

var mouse = Vector2.ZERO


func _enter(data = {}):
	mouse = data.mouse
	left_eye.show()
	right_eye.show()
	$MousePositionTimer.start()


func _exit():
	left_eye.hide()
	right_eye.hide()
	$MousePositionTimer.stop()


func _state_process(delta):
	pass


func _on_MousePositionTimer_timeout():
	rpc_id(1, "mouse", owner.get_global_mouse_position())
