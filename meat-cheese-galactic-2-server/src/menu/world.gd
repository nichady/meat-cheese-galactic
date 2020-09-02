extends Tabs


func _ready():
	Events.connect("game_state_changed", self, "_on_game_state_changed")


func _on_game_state_changed(state):
	$ViewWorld.disabled = state != Game.State.ACTIVE
	$Popup/ViewportContainer/Viewport.world_2d = Game.get_world_resource()


func _on_ViewWorld_pressed():
	OS.window_fullscreen = true
	$Popup.rect_size = OS.window_size
	$Popup.popup()


func _input(event):
	if event.is_action_pressed("ui_cancel"):
		$Popup.hide()
		OS.window_fullscreen = false
