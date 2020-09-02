extends Node


func _ready():
	Events.connect("chat_messaged", self, "_on_chat_messaged")


func _on_chat_messaged(message):
	rpc("send_message", message)


remote func say(message):
	if not (message is String):
		return
	
	var regex = RegEx.new()
	regex.compile("\\s\\s+")
	message = regex.sub(message.strip_escapes().strip_edges(), " ", true).substr(0, 256).replace("[", "[\u200B")
	if not message.empty():
		var user = Lobby.users[str(get_tree().get_rpc_sender_id())]
		var team = "blue" if user.team == Lobby.Team.BLUE else "red" if user.team == Lobby.Team.RED else "white"
		Events.emit_signal("chat_messaged", "[color=" + team + "]" + user.username + ":[/color] " + message)


func broadcast(message):
	var regex = RegEx.new()
	regex.compile("\\s\\s+")
	message = regex.sub(message.strip_escapes().strip_edges(), " ", true).substr(0, 256).replace("[", "[\u200B")
	if not message.empty():
		Events.emit_signal("chat_messaged", "[color=green][Server][/color] " + message)


func info(message):
	Events.emit_signal("chat_messaged", "[color=yellow]" + message + "[/color]")


func whisper(message, id): # TODO make this feature
	pass
