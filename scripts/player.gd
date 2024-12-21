extends CharacterBody2D

const SPEED = 90.0
const JUMP_VELOCITY = -300.0
@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("move_left","move_right")
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		animated_sprite.play("jump")

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		animated_sprite.play("jump")
		
	if direction == 1: # Droite
		animated_sprite.flip_h = false
		velocity.x = direction * SPEED
		animated_sprite.play("run")
		
	elif direction == -1 : #Gauche
		velocity.x = direction * SPEED
		animated_sprite.flip_h = true
		animated_sprite.play("run")
		
	else: #Immobile
		animated_sprite.play("idle")
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
