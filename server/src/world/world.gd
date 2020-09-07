extends Node2D


remote func request_info():
	for entity in $Entities.get_children():
		$Entities.rpc_id(get_tree().get_rpc_sender_id(), "spawn", entity.name, entity.entity_type, entity.position, entity.options)
