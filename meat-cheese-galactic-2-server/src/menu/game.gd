extends Tabs


func _ready():
	Events.connect("user_joined", self, "_on_user_joined")
	Events.connect("user_left", self, "_on_user_left")
	Events.connect("game_state_changed", self, "_on_game_state_changed")
	
	$IP.text = CSUtility.IP


func _on_user_joined(id, username, system_name):
	update_count()


func _on_user_left(id):
	update_count()


func update_count():
	$UsersConnected.text = "1 user online" if Lobby.user_count == 1 else str(Lobby.user_count) + " users online"


func _on_Play_pressed():
	if Game.state == Game.State.IDLE:
		Game.start()
	elif Game.state == Game.State.ACTIVE:
		Game.end()


func _on_game_state_changed(state):
	$State.text = Game.State.keys()[state]
	$Play.disabled = state == Game.State.STARTING or state == Game.State.ENDING
	if state == Game.State.IDLE: $Play.text = "Start Game"
	elif state == Game.State.ACTIVE: $Play.text = "End Game"
