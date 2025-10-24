extends Node
class_name State

var character: CharacterBody3D

## If this value is different than null the state machine will change to
## this state on the next physics frame.
var next_state: State = null


## Called once the state becomes the current state in the state machine.
func _enter_state() -> void:
	pass


## Called once the state is no longer the current state in the state machine.
func _exit_state() -> void:
	pass


## Called once during every physics tick.
func _physics_process_state(delta: float) -> void:
	pass
