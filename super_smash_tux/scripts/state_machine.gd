extends Node
class_name StateMachine

@export var current_state: State
@onready var character: CharacterBody3D

func _ready() -> void:
	character = get_parent()
	for child in get_children():
		if child is State:
			child.character = character
		else:
			push_warning(child.name, " is not a State")
	
	if current_state == null:
		push_error(character.name, " State Machine: Current state has not been set.")
	
	current_state._enter_state()


func _physics_process(delta: float) -> void:
	if current_state.next_state != null:
		current_state._exit_state()
		var next_state = current_state.next_state
		current_state.next_state = null
		current_state = next_state
		current_state._enter_state()
	
	current_state._physics_process_state(delta)
