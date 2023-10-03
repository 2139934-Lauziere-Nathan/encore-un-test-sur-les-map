extends Area2D


func _on_body_entered(body):
	print_debug(Global.life)
	Global.life = Global.life-1




