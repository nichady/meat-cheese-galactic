extends Node

# TODO append all remote functions with underscore
enum State {
	IDLE,
	STARTING,
	ACTIVE,
	ENDING,
}


var state = State.IDLE setget set_state
var world = null


func _ready():
	var world_holder = Viewport.new()
	world_holder.name = "WorldHolder"
	add_child(world_holder)


func set_state(value):
	state = value
	Events.emit_signal("game_state_changed", state)


func start():
	if state == State.IDLE:
		self.state = State.STARTING
		
		world = Globals.World.instance()
		world.connect("ready", self, "_on_World_ready")
		world.connect("tree_exited", self, "_on_World_tree_exited")
		# TODO replace  all get_root() with root
		$WorldHolder.add_child(world)


func end():
	if state == State.ACTIVE:
		self.state = State.ENDING
	
		world.queue_free()


func _on_World_ready():
	self.state = State.ACTIVE
	for id in Lobby.users:
		rpc_id(int(id), "start", Lobby.users[id].team)


func _on_World_tree_exited():
	self.state = State.IDLE
	world = null


func get_world_resource():
	return $WorldHolder.world_2d
