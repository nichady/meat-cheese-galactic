extends Node


func _ready():
	CSUtility.CreateRedirectServer()
	var server = NetworkedMultiplayerENet.new()
	server.create_server(50303, 20)
	get_tree().network_peer = server
	server.connect("peer_connected", self, "_on_peer_connected")
	server.connect("peer_disconnected", self, "_on_peer_disconnected")


func _on_peer_connected(id):
	rpc_id(id, "callback")


func _on_peer_disconnected(id):
	Lobby.remove_user(str(id))


remote func join_server(username, system_name):
	if not (username is String and system_name is String):
		return
	
	var regex = RegEx.new()
	regex.compile("\\W")
	username = regex.sub(username, "", true).substr(0, 16)
	
	if username.empty():
		username = "Anonymous"
	
	Lobby.add_user(str(get_tree().get_rpc_sender_id()), username, system_name)
	Chat.info(username + " has joined the server")
