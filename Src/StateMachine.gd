extends Node

class_name StateMachine

# the state machine monitors basic state changes
# emits a signal when state has changed

func set_state(newState) -> void:
	if state == newState: return
	# else
	
	previous_state = state
	state = newState

	emit_signal("state_changed", previous_state, state)

var state = null
var previous_state = null

signal state_changed
