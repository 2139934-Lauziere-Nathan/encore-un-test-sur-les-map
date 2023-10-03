extends CharacterBody2D

var speed = 300.0
var jump_speed = 400.0
var life = Global.life
var is_jumping = false
var double_saut = 0
# Get the gravity from the project settings so you can sync with rigid body nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity") 
	

	
func _physics_process(delta):
	if Input.is_action_just_pressed("saut") and is_on_floor():
			velocity.y = (0.8 -jump_speed )
			double_saut = 1
			
			
	if Input.is_action_just_pressed("saut") and double_saut == 1  and !is_on_floor():
			velocity.y = (1 * -jump_speed )
			double_saut = 0
			
			

	else:
		velocity.y += gravity * delta 
	
	if is_on_floor():
		double_saut = 1


	# Get the input direction.
	var direction = Input.get_axis("mouvement-gauche", "mouvement-droit")
	velocity.x = direction * speed

	move_and_slide()

