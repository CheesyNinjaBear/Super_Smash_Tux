extends State

@onready var ground_state: State = $"../GroundState"
const AIR_SPEED = 120.0

func _physics_process_state(delta: float) -> void:
	if character.is_on_floor():
		next_state = ground_state
	
	character.velocity += character.get_gravity() * delta
	
	var dir := Input.get_axis("left", "right")
	
	if dir:
		character.velocity.x = dir * AIR_SPEED * delta
	else:
		character.velocity.x = move_toward(character.velocity.x, 0, AIR_SPEED)
	
	character.move_and_slide()
