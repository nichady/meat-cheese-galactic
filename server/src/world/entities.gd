extends Node


const _entity_types = {
	"planet": preload("res://src/entities/planet/planet.tscn"),
	"player.trey": preload("res://src/entities/player/trey/trey.tscn"),
}


func _ready():
	for entity in get_children():
		entity.init(entity.entity_type, entity.options)


func spawn(entity_type, position, options, send = true): # TODO entity_type -> type
	var entity = _entity_types[entity_type].instance()
	entity.position = position
	entity.init(entity_type, options)
	add_child(entity, true)
	if send:
		rpc("spawn", entity.name, entity_type, position, options)
