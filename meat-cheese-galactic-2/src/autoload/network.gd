extends Node


func _ready():
	Events.connect("server_found", self, "_on_server_found")

func _on_server_found(ip, port, user_count):
	if get_tree().network_peer == null:
		var client = NetworkedMultiplayerENet.new()
		client.create_client(ip, port)
		get_tree().network_peer = client

puppet func callback():
	rpc_id(1, "join_server", $"/root/ConnectMenu/Username".text, CSUtility.SystemName)
	Events.emit_signal("server_joined")
