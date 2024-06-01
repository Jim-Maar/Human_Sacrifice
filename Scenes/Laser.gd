extends RayCast2D

signal killed

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var dispenser = self.get_parent()
	var ray_start = dispenser.get_global_position()
	var start_pos = ray_start
	var end_pos = ray_start + Vector2(0, 20)
	if is_colliding():
		var body = get_collider()
		var body_pos = get_collision_point()
		end_pos = body_pos
		if body.name == "Player":
			killed.emit()
	var line = Line2D.new()
	add_child(line)

	var color = Color(1, 0, 0)  # Red color
	var width = 5.0  # Line width
	
	line.points = [start_pos, end_pos]
	line.width = width
	line.default_color = color
	# draw_line(ray_start, body_pos, Color(1, 0, 0), 20)
	# var canvas_item = CanvasItem.new.call()
	# canvas_item.queue_redraw()
