extends CollisionShape2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func _on_item_heal_child_entered_tree(node):
	print_debug(Global.life)
	Global.life = Global.life-1
	pass # Replace with function body.

func _on_tree_entered():
	pass # Replace with function body.
