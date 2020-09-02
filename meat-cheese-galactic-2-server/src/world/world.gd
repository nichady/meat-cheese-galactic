extends Node2D


remote func request_info():
	for entity in $Entities.get_children():
		$Entities.rpc_id(get_tree().get_rpc_sender_id(), "spawn", entity.name, entity.entity_type, entity.position, entity.options)


func _ready():
	spawn_players()

# maybe move to entities?
func spawn_players():
	var users = Lobby.get_blues()
	var points = []
	match users.size():
		1, 3, 5:
			points.append($Spawnpoints/Blue/Front)
			continue
		2, 3, 4, 5:
			points.append($Spawnpoints/Blue/Left1)
			points.append($Spawnpoints/Blue/Right1)
			continue
		4, 5:
			points.append($Spawnpoints/Blue/Left2)
			points.append($Spawnpoints/Blue/Right2)
			continue
	points.shuffle()
	for i in users.size():
		$Entities.spawn("player.trey", points[i].position, {
			"team": 0,
			"user": users[i],
		})
