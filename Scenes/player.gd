extends CharacterBody2D


@export var SPEED = 300.0
@export var JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("Move_Left", "Move_Right")
	if direction:
		velocity.x = direction * SPEED
		
		if direction == -1:
			$Sprite2D.flip_h = true
		
		else:
			$Sprite2D.flip_h = false
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
