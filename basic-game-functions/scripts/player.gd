extends CharacterBody2D
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D


const SPEED = 120
const JUMP_VELOCITY = -260.0
var direction_facing = 'right'
var animation_name = 'idle'
const JUMP_CUT_MULTIPLIER = 0.25


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		animation_name = 'jump'

	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	# Releasing jump early makes the jump shorter.
	if Input.is_action_just_released("jump") and velocity.y < 0.0:
		velocity.y *= JUMP_CUT_MULTIPLIER
	
	# Flip the sprite
	if direction > 0:
		animated_sprite.flip_h = false
		direction_facing = 'right'
		animation_name = 'right'
	elif direction < 0:
		animated_sprite.flip_h = true
		direction_facing = 'left'
		animation_name = 'left'

	# Apply movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	
	#Apply animation
	if animation_name == 'jump':
		animated_sprite.play("jump")
		animation_name = 'idle'
	elif animation_name == 'right' || animation_name == 'left':
		if direction != 0:
			animated_sprite.play("walk")
		else: 
			animated_sprite.play("idle")
	else:
		animated_sprite.play("idle")
	
	move_and_slide()
