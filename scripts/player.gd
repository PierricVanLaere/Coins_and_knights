extends CharacterBody2D

const SPEED = 90.0
const JUMP_VELOCITY = -300.0
@onready var animated_sprite = $AnimatedSprite2D
@onready var timer = $Timer
var is_rolling = false
var is_alive = true
var side = 1

func _physics_process(delta: float) -> void:
	if is_rolling:
		if not is_on_floor():
			velocity += get_gravity() * delta
		move_and_slide()
		return
		
	# Add the gravity.
	if not is_on_floor():
		fall(delta)

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		if is_alive:
			animated_sprite.play("jump")
		else:
			animated_sprite.play("hit")
			
	if Input.is_action_just_pressed("roll") and is_on_floor():
		roll()
			
	var direction := Input.get_axis("move_left","move_right")
	if direction: # Droite
		side = direction
		velocity.x = direction * SPEED
		if is_alive:
			animated_sprite.play("run")
		else:
			animated_sprite.play("hit")
		if direction == 1:
			animated_sprite.flip_h = false
		else:
			animated_sprite.flip_h = true
		if Input.is_action_just_pressed("roll") and is_on_floor():
			roll()
	else: #Immobile
		if not is_rolling and is_alive:
			animated_sprite.play("idle")
			velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()

func roll():
	is_rolling = true
	animated_sprite.play("roll")
	velocity.x = side * SPEED
	timer.start()
	
func fall(delta):
	velocity += get_gravity() * delta
	if is_alive : 
		animated_sprite.play("jump")
	else:
		animated_sprite.play("hit")
func _on_timer_timeout() -> void:
	is_rolling = false
	velocity.x = move_toward(velocity.x, 0, SPEED)
