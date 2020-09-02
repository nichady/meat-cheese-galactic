extends Node2D
class_name Entity


export(String) var entity_type
export(Dictionary) var options


func init(entity_type, options):
	self.entity_type = entity_type
	self.options = options
