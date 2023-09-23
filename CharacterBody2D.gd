extends CharacterBody2D

var speed = 300.0
var jump_speed = 400.0

# Get the gravity from the project settings so you can sync with rigid body nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_pressed("saut"):
		# Apply an upward force to make the character jump
		velocity.y = -jump_speed
	else:
		velocity.y += gravity * delta  # Apply gravity to simulate falling


	# Get the input direction.
	if Input.is_action_pressed("mouvement-droit") || Input.is_action_pressed("mouvement-droit"):
		var direction = Input.get_axis("mouvement-gauche", "mouvement-droit")
		velocity.x = direction * speed
	#else:
	#	velocity.x = 0
	#	velocity.y = 0
		
	if  Input.is_action_pressed("mouvement-gauche"):
		var direction = Input.get_axis("mouvement-gauche", "mouvement-droit")
		velocity.x = direction * speed
	#else:
	#	velocity.x = 0
	#	velocity.y = 0
		
	
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$run_anim.play()
	else:
		$run_anim.stop()	
		
	move_and_slide()
