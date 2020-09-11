extends Node
class_name StateMachine


onready var _state = get_children()[0]


func _ready():
	_state._enter()


func _physics_process(delta):
	_state._state_process(delta)


func transition_to(state, data = {}): # TODO dont know if data is needed; if not, replace with setter
	rpc("transition_to", state, data)
	_state._exit()
	_state = get_node(state)
	_state._enter(data)
