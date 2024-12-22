extends Node2D

const SPEED = 45
var direction = 1
var is_alive = true
@onready var ray_cast_right = $RayCastRight 
@onready var ray_cast_left = $RayCastLeft
@onready var animated_sprite = $AnimatedSprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not is_alive:
		queue_free()
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite.flip_h = true
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite.flip_h = false
	position.x += direction * SPEED * delta


func _on_head_body_entered(body: Node2D) -> void:
	body.velocity.y = -300  # Ajuste cette valeur pour un rebond réaliste
	self.is_alive=false
