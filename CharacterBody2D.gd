extends CharacterBody2D

var speed = 300.0
var jump_speed = 400.0

var is_jumping = false

# Get the gravity from the project settings so you can sync with rigid body nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity") 
	

func _physics_process(delta):
	
		#LIGNE À MODIFIÉ POUR ENLEVÉ LE FLY
	if Input.is_action_pressed("saut") and not is_jumping:
		velocity.y = -jump_speed
		is_jumping = true  
	else:
		velocity.y += gravity * delta 

	if is_on_floor():
		is_jumping = false


	# Get the input direction.
	var direction = Input.get_axis("mouvement-gauche", "mouvement-droit")
	velocity.x = direction * speed

	move_and_slide()
