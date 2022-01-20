extends StateMachine

class_name HierarchyStateMachine

# a hierarchy state machine will allow you to add childrens to it

# OVERRIDE
func _state_changed(previous_state, new_state) -> void:
	_raise_children_state_changes(previous_state, new_state)

func register_all_children() -> void:
	var children = get_children()
	
	for child in children:
		if child is StateChild:
			register_child(child)

func register_child(state_child: StateChild) -> void:
	_stateChildren.append(state_child)
	
func register_children(state_children: Array) -> void:
	_stateChildren.append_array(state_children)

func _raise_children_state_changes(previous_state, new_state) -> void:
	for	stateChild in _stateChildren:
		if stateChild.accepts(previous_state):
			stateChild.raise_state_exit(previous_state, new_state)
			continue
		# else
		
		if stateChild.accepts(new_state):
			stateChild.raise_state_enter(previous_state, new_state)

var _stateChildren : Array
