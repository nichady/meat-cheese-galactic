extends Node


func _ready():
	var world_holder = Node.new()
	world_holder.name = "WorldHolder"
	add_child(world_holder)


puppet func start(team):
	$WorldHolder.add_child(Globals.World.instance())
	get_tree().current_scene.queue_free()


puppet func end():
	pass
