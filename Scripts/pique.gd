extends Area2D

func _on_Teleporter_body_entered(body):
		body.set_global_position(Vector2(0, 0))  # Téléporte le joueur à la position (0, 0).




func _on_body_entered(body):
	print_debug(Global.life)
	Global.life = Global.life-1




