extends Node2D


onready var camera = $Camera


func _ready():
	rpc_id(1, "request_info")
