extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("W") or Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Handle crouch
	#if Input.is_action_just_pressed("ui_down") or Input.is_action_just_pressed("S") and is_on_floor():
		#velocity.y = -JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_action_strength("D") - Input.get_action_strength("A") #move with WASD
	direction += Input.get_axis("ui_left", "ui_right") #move with arrows

	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
