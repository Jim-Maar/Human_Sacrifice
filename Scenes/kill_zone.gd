extends Area2D

signal killed

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta):
# 	pass

func _on_body_entered(body:Node2D):
	if body.name == "Player":
		emit_signal("killed")
		# body.queue_free()


func _on_killed():
	pass # Replace with function body.
