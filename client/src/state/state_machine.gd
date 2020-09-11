extends Node
class_name StateMachine


onready var _state = get_children()[0]


func _ready():
	_state._enter()


func _physics_process(delta):
	_state._state_process(delta)


puppet func transition_to(state: String, data = {}): # TODO dont know if data is needed; if not, replace with setter
	_state._exit()
	_state = get_node(state)
	_state._enter(data)
