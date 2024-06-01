extends RayCast2D

signal killed

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
'''func _process(delta):
	if is_colliding():
		var body = get_collider()
		var body_pos = body.get_pos()
		if body.name == "Player":
			killed.emit()
		var pos = get_global_pos()
		draw_line(pos, body_pos, Color(1, 0, 0), 2)
'''
