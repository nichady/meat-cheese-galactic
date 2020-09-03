extends Node2D


remote func request_info():
	for entity in $Entities.get_children():
		$Entities.rpc_id(get_tree().get_rpc_sender_id(), "spawn", entity.name, entity.entity_type, entity.position, entity.options)


func _ready():
	spawn_players()

# maybe move to entities?
func spawn_players():
	for team in 2:
		var users = Lobby.get_blues() if team == 0 else Lobby.get_reds()
		var points = []
		var sp = $Spawnpoints/Blue if team == 0 else $Spawnpoints/Red
		match users.size():
			1, 3, 5:
				points.append(sp.get_node("Front"))
				continue
			2, 3, 4, 5:
				points.append(sp.get_node("Left1"))
				points.append(sp.get_node("Right1"))
				continue
			4, 5:
				points.append(sp.get_node("Left2"))
				points.append(sp.get_node("Right2"))
				continue
		points.shuffle()
		for i in users.size():
			$Entities.spawn("player.trey", points[i].position, {
				"user_id": users[i].id,
				"team": team,
			}, false)
