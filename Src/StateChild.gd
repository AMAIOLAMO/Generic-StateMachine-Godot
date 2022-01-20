extends Node

class_name StateChild

# VIRTUAL
func accepts(state) -> bool:
	return false

func raise_state_enter(previous_state, entered_state) -> void:
	_on_state_entered(previous_state, entered_state)
	
func raise_state_exit(previous_state, new_state) -> void:
	_on_state_exitted(previous_state, new_state)

# VIRTUAL
func _on_state_entered(previous_state, entered_state) -> void:
	pass

# VIRTUAL
func _on_state_exitted(previous_state, new_state) -> void:
	pass
