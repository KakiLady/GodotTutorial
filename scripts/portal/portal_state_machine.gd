class_name PortalStateMachine extends Node

var states = {}
var current_state: String

var model: PortalModel

func _ready():
	states = _initialize_states()
	current_state = "PortalIdleState"

func accept_model(model: PortalModel):
	self.model = model
	for child in get_children():
		if child is PortalState:
			child.model = model

func process(input: PortalInputPackage, delta: float):
	transition_current_state(input)
	process_current_state(input, delta)
	
	

func _initialize_states() -> Dictionary:
	var states_from_tree = {}
	for child in get_children():
		if child is PortalState:
			states_from_tree[child.name] = child
	return states_from_tree

func transition_current_state(input: PortalInputPackage):
	var portal_state: PortalState = states[current_state]
	var new_state = portal_state.transition(input)
	if new_state != current_state:
		portal_state.exit_state()
		var new_portal_state: PortalState = states[new_state]
		new_portal_state.enter_state()
		current_state = new_state

func process_current_state(input: PortalInputPackage, delta: float):
	var portal_state: PortalState = states[current_state]
	portal_state.process(input, delta)
