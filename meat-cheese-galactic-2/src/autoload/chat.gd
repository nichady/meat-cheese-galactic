extends Node


puppet func send_message(message):
	Events.emit_signal("chat_messaged", message)


func say(message):
	rpc_id(1, "say", message)
