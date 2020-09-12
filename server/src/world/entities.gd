extends Node


const _entity_types = { # replace with export(PackedScene)
	"planet": preload("res://src/entities/planet/planet.tscn"),
	"player.trey": preload("res://src/entities/player/trey/trey.tscn"),
	"projectile.bolt": preload("res://src/entities/projectile/bolt/bolt.tscn"),
}


func _ready():
	for entity in get_children():
		entity.init(entity.entity_type, entity.options)
	spawn_players()


func spawn(entity_type, position, options, send = true): # TODO entity_type -> type
	var entity = _entity_types[entity_type].instance()
	entity.position = position
	entity.init(entity_type, options)
	add_child(entity, true)
	if send:
		rpc("spawn", entity.name, entity_type, position, options)


func correct(id = null):
	for entity in get_children():
		entity.correct(id)


func spawn_players():
	for team in 2:
		var users = Lobby.get_blues() if team == 0 else Lobby.get_reds()
		var points = []
		var sp = $"../Spawnpoints/Blue" if team == 0 else $"../Spawnpoints/Red"
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
			spawn("player.trey", points[i].position, {
				"user_id": users[i].id,
				"team": team,
			}, false)
