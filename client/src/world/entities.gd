extends Node


const _entity_types = {
	"planet": preload("res://src/entities/planet/planet.tscn"),
	"player.trey": preload("res://src/entities/player/trey/trey.tscn"),
}


puppet func spawn(name, entity_type, position, options): # TODO not sure if storing enetity type is needed on client
	var entity = _entity_types[entity_type].instance()
	entity.name = name
	entity.position = position
	entity.init(entity_type, options)
	add_child(entity, false) # TRUE instead???
