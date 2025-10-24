extends State

@onready var air_state: State = $"../AirState"
const WALK_SPEED = 150.0
const JUMP_VELOCITY = 9.0

func _physics_process_state(delta: float) -> void:
	if !character.is_on_floor():
		next_state = air_state
	
	var dir := Input.get_axis("left", "right")
	
	if dir:
		character.velocity.x = dir * WALK_SPEED * delta
	else:
		character.velocity.x = move_toward(character.velocity.x, 0, WALK_SPEED)
	
	if Input.is_action_just_pressed("up"):
		character.velocity.y = JUMP_VELOCITY
		next_state = air_state
	
	character.move_and_slide()
