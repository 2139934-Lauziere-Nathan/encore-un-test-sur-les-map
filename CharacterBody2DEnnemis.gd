extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
enum {IDLE, RUN, ATTACK}
var state = RUN
@onready var anim = $AnimatedSprite2DEnemis
@onready var ray2D = $RayCast2D
var time = Timer.new()
var timeActuel = time
var is_mouving_left = true

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")



func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	match state:
		IDLE:
			anim.play("Idle")
			
		RUN:
			anim.play("Run")
			detect_turn_around()
			velocity.x = SPEED if is_mouving_left else - SPEED
		ATTACK:
			Global.life-1
			anim.play("attack")


	move_and_slide()
	


func detect_turn_around():
	
	if  is_on_wall():
		is_mouving_left = !is_mouving_left
		scale.x = -scale.x
	if not ray2D.is_colliding():
		is_mouving_left = !is_mouving_left
		scale.x = -scale.x
func _on_area_2d_body_entered(body):
	
	pass # Replace with function body.


func _on_area_2d_body_exited(body):
	pass # Replace with function body.
