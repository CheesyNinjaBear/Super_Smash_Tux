extends CharacterBody3D


const SPEED = 7.0
const JUMP_VELOCITY = 9.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY


	# rotate the player when you move
	#if Input.is_action_just_pressed("ui_right"):
	#	self.look_at(Vector3(-1,0,0), Vector3(1,0,0))
		
	#if Input.is_action_just_pressed("ui_left"):
	#	self.rotate_y(180)
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.		
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, 0)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		#velocity.z = direction.z * SPEED # causes the player to go forward/backward
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		#velocity.z = move_toward(velocity.z, 0, SPEED)
		
	#if velocity.x != 0:
	#	self.look_at(Vector3(input_dir.x, 0, 0))



	move_and_slide()
