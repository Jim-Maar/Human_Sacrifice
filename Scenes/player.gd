extends CharacterBody2D


@export var SPEED = 2000.0
@export var JUMP_VELOCITY = -2000.0

@onready var platform = preload("res://Scenes/Platform.tscn")

@onready var player_animation: AnimatedSprite2D = $AnimatedSprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _ready():
	var kill_zone = get_parent().get_node("KillZone")  # Adjust the path to your player node
	kill_zone.connect("killed", _on_killed)


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta * 5
		player_animation.play("jump")
	
	
		

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("Move_Left", "Move_Right")
	if direction:
		velocity.x = direction * SPEED
		
		player_animation.play("walk")
		
		if direction == -1:
			$AnimatedSprite2D.flip_h = true
		
		else:
			$AnimatedSprite2D.flip_h = false
		
	else:
		player_animation.play("idle")
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()

func _on_killed():
	var instance = platform.instantiate()

	instance.global_position.x = self.global_position.x 
	instance.global_position.y = self.global_position.y + 50

	#self.position = SPAWN_POINT
	get_parent().add_child(instance)
	print("Player killed")
